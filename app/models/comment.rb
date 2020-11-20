class Comment < ApplicationRecord
  belongs_to :student
  belongs_to :event #notification
  has_many :notifications, dependent: :destroy
end
