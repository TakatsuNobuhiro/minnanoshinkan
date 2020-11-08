class Event < ApplicationRecord
  belongs_to :club
  has_rich_text :content
  def self.search(search)
    return Event.all unless search
    Event.where(['title LIKE ?', "%#{search}%"])
  end
end
