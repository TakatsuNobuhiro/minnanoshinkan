class PremiumMail < ApplicationRecord
  belongs_to :club
  has_rich_text :content
  validates :title, presence: true, length: { in: 1..100 }
end
