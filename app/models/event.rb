class Event < ApplicationRecord
  belongs_to :club
  has_rich_text :content
  has_many :comments, dependent: :destroy
  def self.events_search(search)
    Event.where(['title LIKE ?', "%#{search}%"])
  end
  has_many :event_favorites, dependent: :destroy 
  has_many :student_event_likes, through: :event_favorites,source: :student
  #tag
  has_many  :tag_relationships, dependent: :destroy
  has_many  :tags, through: :tag_relationships,source: :tag



  def save_tags(save_event_tags)
    current_tags = self.tags.pluck(:name) unless self.tags.nil?
    old_tags = current_tags - save_event_tags
    new_tags = save_event_tags - current_tags

    old_tags.each do |old_name|
      self.tags.delete Tag.find_by(name: old_name)
    end

    new_tags.each do |new_name|
      event_tag = Tag.find_or_create_by(name: new_name)
      self.tags << event_tag
    end
  end
  def start_time
    self.start
  end 

end
