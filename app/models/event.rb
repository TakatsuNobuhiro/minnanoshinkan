class Event < ApplicationRecord
  validates :title, presence: true, length: { in: 1..100 }
  validates :start, presence: true
  validates :end, presence: true
  validate :start_end_check
  def start_end_check
    errors.add(:end, 'の日付を正しく記入してください。') unless self.start < self.end
  end
  belongs_to :club
  has_rich_text :content
  has_many :comments, dependent: :destroy

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  def self.events_title_search(search)
    return self unless search

    self.where(['title LIKE ?', "%#{search}%"])
  end

  has_many :event_favorites, dependent: :destroy
  has_many :student_event_likes, through: :event_favorites, source: :student #tag
  has_many :tag_relationships, dependent: :destroy
  has_many :tags, through: :tag_relationships, source: :tag

  def save_tags(save_event_tags)
    current_tags = self.tags.pluck(:name) unless self.tags.nil?
    old_tags = current_tags - save_event_tags
    new_tags = save_event_tags - current_tags

    old_tags.each { |old_name| self.tags.delete Tag.find_by(name: old_name) }

    new_tags.each do |new_name|
      event_tag = Tag.find_or_create_by(name: new_name)
      self.tags << event_tag
    end
  end
  def start_time
    self.start
  end #notification

  has_many :notifications, dependent: :destroy #お気に入り（イベント）
  def create_notification_like!(current_user)
    temp =
      Notification.where(
        [
          'student_visitor_id = ? and club_visited_id = ? and event_id = ? and action = ? ',
          current_user.id,
          club_id,
          id,
          'event_like'
        ]
      )

    if temp.blank?
      notification =
        current_user.active_notifications.new(
          event_id: id, club_visited_id: club_id, action: 'event_like'
        )

      notification.save if notification.valid?
    end
  end

  #コメント
  def create_notification_comment!(current_user, comment_id)
    #同じ投稿にコメントしているユーザーに通知を送る。（current_userと投稿ユーザーのぞく）

    comment_ids =
      Comment.where(event_id: id).where.not('student_id=?', current_user.id)
        .select(:student_id).distinct
    favorite_ids =
      EventFavorite.where(event_id: id).where.not(
        'student_id=?',
        current_user.id
      ).select(:student_id)
    temp_ids = []
    ids = comment_ids | favorite_ids
    ids.each { |i| temp_ids.push(i['student_id']) } #重複を削除

    temp_ids = temp_ids.uniq #取得したユーザー達へ通知を作成。（user_idのみ繰り返し取得）
    temp_ids.each do |temp_id|
      save_student_notification_comment!(current_user, comment_id, temp_id)
    end #投稿者へ通知を作成

    save_club_notification_comment!(current_user, comment_id, self.club.id)
  end

  def save_student_notification_comment!(current_user, comment_id, visited_id)
    notification =
      current_user.active_notifications.new(
        event_id: id,
        comment_id: comment_id,
        student_visited_id: visited_id,
        action: 'comment'
      )

    notification.save if notification.valid?
  end

  def save_club_notification_comment!(current_user, comment_id, visited_id)
    notification =
      current_user.active_notifications.new(
        event_id: id,
        comment_id: comment_id,
        club_visited_id: visited_id,
        action: 'comment'
      )

    notification.save if notification.valid?
  end

  #イベント投稿
  def create_notification_event!(current_user)
    favorite_ids = ClubFavorite.where(club_id: current_user.id)
    temp_ids = []
    favorite_ids.each { |f| temp_ids.push(f['student_id']) }

    temp_ids.each do |temp_id|
      notification =
        current_user.active_notifications.new(
          event_id: id, student_visited_id: temp_id, action: 'event'
        )
      notification.save if notification.valid?
    end
  end
end
