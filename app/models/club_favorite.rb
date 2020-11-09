class ClubFavorite < ApplicationRecord
  belongs_to :club
  belongs_to :student
end
