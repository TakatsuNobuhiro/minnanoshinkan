class Event < ApplicationRecord
  belongs_to :club
  has_rich_text :content
end
