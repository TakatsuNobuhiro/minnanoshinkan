class CreateNotifications < ActiveRecord::Migration[6.0]
  def change
    create_table :notifications do |t|
      t.references :club_visitor, null: false, foreign_key:{ to_table: :clubs }
      t.references :club_visited, null: false, foreign_key:{ to_table: :clubs }
      t.references :student_visitor, null: false, foreign_key:{ to_table: :students }
      t.references :student_visited, null: false, foreign_key:{ to_table: :students }
      t.references :event, null: false, foreign_key: true
      t.references :comment, null: false, foreign_key: true
      t.string :action
      t.boolean :checked, default: false

      t.timestamps
    end
  end
end
