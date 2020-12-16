class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true 


  def self.search(search)
    return all unless search

    where(['name LIKE ?', "%#{search}%"])
  end
end
