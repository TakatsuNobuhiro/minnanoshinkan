class PremiumMail < ApplicationRecord
  belongs_to :club
  validates :title, presence: true
  validates :message, presence: true
end
