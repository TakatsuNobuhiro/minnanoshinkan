class Club < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  #active_storage
  has_one_attached :avatar
  validates :avatar, content_type: { in: %w[image/jpg image/jpeg image/gif image/png],
                          message: "must be a valid image format" },
                             size:   { less_than: 5.megabytes,
                          message: "should be less than 5MB" }
  enum active: { 文化系: false, 運動部: true}
  enum intercollege: { 学内: false, インカレ: true}
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :timeoutable, :trackable
end
