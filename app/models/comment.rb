class Comment < ApplicationRecord
  belongs_to :student
  belongs_to :event
  has_many :notifications, dependent: :destroy
  validates :content, presence: true, length: { in: 1..140 }
end
