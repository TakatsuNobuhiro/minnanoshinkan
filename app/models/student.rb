class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  #follow
  has_many :relationships, dependent: :destroy
  has_many :followings, through: :relationships, source: :follow
  has_many :reverses_of_relationship, class_name: 'Relationship', foreign_key: 'follow_id', dependent: :destroy
  has_many :followers, through: :reverses_of_relationship, source: :student
  def follow(other_student)
    unless self == other_student
      self.relationships.find_or_create_by(follow_id: other_student.id)
    end
  end

  def unfollow(other_student)
    relationship = self.relationships.find_by(follow_id: other_student.id)
    relationship.destroy if relationship
  end

  def following?(other_student)
    self.followings.include?(other_student)
  end
  #active_storage
  has_one_attached :avatar
  validates :avatar, content_type: { in: %w[image/jpg image/jpeg image/gif image/png],
                          message: "must be a valid image format" },
                             size:   { less_than: 5.megabytes,
                          message: "should be less than 5MB" }
  enum gender: { 男: 1, 女: 2, 未選択: 3}
  enum prefecture:{
    "---":0,
    北海道:1,青森県:2,岩手県:3,宮城県:4,秋田県:5,山形県:6,福島県:7,
    茨城県:8,栃木県:9,群馬県:10,埼玉県:11,千葉県:12,東京都:13,神奈川県:14,
    新潟県:15,富山県:16,石川県:17,福井県:18,山梨県:19,長野県:20,
    岐阜県:21,静岡県:22,愛知県:23,三重県:24,
    滋賀県:25,京都府:26,大阪府:27,兵庫県:28,奈良県:29,和歌山県:30,
    鳥取県:31,島根県:32,岡山県:33,広島県:34,山口県:35,
    徳島県:36,香川県:37,愛媛県:38,高知県:39,
    福岡県:40,佐賀県:41,長崎県:42,熊本県:43,大分県:44,宮崎県:45,鹿児島県:46,
    沖縄県:47
  }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :timeoutable, :trackable, :omniauthable, omniauth_providers: %i[facebook twitter google_oauth2]


  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end

  has_many :comments, dependent: :destroy
 #club_favorite
  has_many :club_favorites, dependent: :destroy
  has_many :club_likes,through: :club_favorites,source: :club
  def club_favorite(club)

    self.club_favorites.find_or_create_by(club_id: club.id)
  end
  
  def club_unfavorite(club)
    club_favorite = self.club_favorites.find_by(club_id: club.id)
    club_favorite.destroy if club_favorite 
  end
  
  def club_favorite?(club)
    self.club_likes.include?(club)
  end
end
