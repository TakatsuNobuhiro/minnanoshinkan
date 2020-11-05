class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one_attached :avatar
  validates :avatar, content_type: { in: %w[image/jpg image/jpeg image/gif image/png],
                          message: "must be a valid image format" },
                             size:   { less_than: 5.megabytes,
                          message: "should be less than 5MB" }
  enum gender: { man: 1, female: 2, other: 3}
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :timeoutable, :trackable, :omniauthable, omniauth_providers: %i[facebook twitter google_oauth2]


  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end
end
