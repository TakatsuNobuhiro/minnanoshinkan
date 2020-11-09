class CreateClubFavorites < ActiveRecord::Migration[6.0]
  def change
    create_table :club_favorites do |t|
      t.references :club, null: false, foreign_key: true
      t.references :student, null: false, foreign_key: true

      t.timestamps
    end
  end
end
