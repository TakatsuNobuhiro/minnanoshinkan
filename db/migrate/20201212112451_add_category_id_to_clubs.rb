class AddCategoryIdToClubs < ActiveRecord::Migration[6.0]
  def change
    add_reference :clubs, :category, foreign_key: true
  end
end
