class Category < ApplicationRecord
  has_many :students
  has_many :clubs
  has_ancestry
end
