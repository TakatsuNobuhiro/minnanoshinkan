class Club < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  #active_storage
  has_many :events, dependent: :destroy
  has_one_attached :avatar
  validates :avatar, content_type: { in: %w[image/jpg image/jpeg image/gif image/png],
                          message: "must be a valid image format" },
                             size:   { less_than: 5.megabytes,
                          message: "should be less than 5MB" }
  enum active: { 文化系: false, 運動系: true}
  enum intercollege: { 学内: false, インカレ: true}
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :timeoutable, :trackable

                        
  has_many :club_favorites, dependent: :destroy 
  has_many :student_likes, through: :club_favorites,source: :student
  #premium_mail
  has_many :premium_mails
  def self.search(search)
    return Club.all unless search
    Club.where(['name LIKE ?', "%#{search}%"])
  end
end
