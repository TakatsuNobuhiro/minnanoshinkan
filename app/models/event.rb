class Event < ApplicationRecord
  belongs_to :club
  has_rich_text :content
  has_many :comments, dependent: :destroy
  def self.search(search)
    return Event.all unless search
    Event.where(['title LIKE ?', "%#{search}%"])
  end
  has_many :event_favorites, dependent: :destroy 
  has_many :student_event_likes, through: :event_favorites,source: :student
end
