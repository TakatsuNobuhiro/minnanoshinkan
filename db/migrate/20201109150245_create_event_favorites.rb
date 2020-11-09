class CreateEventFavorites < ActiveRecord::Migration[6.0]
  def change
    create_table :event_favorites do |t|
      t.references :student, null: false, foreign_key: true
      t.references :club, null: false, foreign_key: true

      t.timestamps
    end
  end
end
