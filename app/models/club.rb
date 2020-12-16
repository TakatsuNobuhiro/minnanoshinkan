class Club < ApplicationRecord #active_storage # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable # Include default devise modules. Others available are:
  belongs_to :category
  enum active: { 文化系: false, 運動系: true }
  enum intercollege: { 学内: false, インカレ: true }
  has_many :events, dependent: :destroy
  has_one_attached :avatar
  validates :avatar,
            content_type: {
              in: %w[image/jpg image/jpeg image/gif image/png],
              message: 'must be a valid image format'
            },
            size: { less_than: 5.megabytes, message: 'should be less than 5MB' }
  validates :name,
            presence: true,
            on: %i[update create],
            unless: :encrypted_password_changed?,
            length: { in: 1..75 }
  validates :active,
            presence: true,
            on: :create,
            unless: :encrypted_password_changed?,
            inclusion: { in: Club.actives.keys }
  validates :category_id,
            presence: true,
            on: :update,
            unless: :encrypted_password_changed?,
            inclusion: { in: Category.ids }

  validates :intercollege,
            presence: true,
            on: :update,
            unless: :encrypted_password_changed?,
            inclusion: { in: Club.intercolleges.keys }
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :confirmable,
         :lockable,
         :trackable

  has_many :club_favorites, dependent: :destroy
  has_many :student_likes, through: :club_favorites, source: :student #premium_mail
  has_many :premium_mails

  #notificaton
  has_many :active_notifications,
           foreign_key: 'club_visitor_id',
           class_name: 'Notification',
           dependent: :destroy
  has_many :passive_notifications,
           foreign_key: 'club_visited_id',
           class_name: 'Notification',
           dependent: :destroy #お気に入り（クラブ）
  def create_notification_like!(current_user)
    temp =
      Notification.where(
        [
          'student_visitor_id = ? and club_visited_id = ? and action = ? ',
          current_user.id,
          id,
          'club_like'
        ]
      )

    if temp.blank?
      notification =
        current_user.active_notifications.new(
          club_visited_id: id, action: 'club_like'
        )

      notification.save if notification.valid?
    end
  end

  def self.guest
    find_or_create_by!(email: 'test@example.com',category_id: 1) do |user|
      user.password = SecureRandom.urlsafe_base64
      user.confirmed_at = Time.now # Confirmable を使用している場合は必要
      user.active = true
    end
  end
end
