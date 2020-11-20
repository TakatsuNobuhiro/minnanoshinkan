class CreateRelationships < ActiveRecord::Migration[6.0]
  def change
    create_table :relationships do |t|
      t.references :student, null: false, foreign_key: true
      t.references :follow, null: false, foreign_key: { to_table: :students }
      t.index %i[student_id follow_id], unique: true
      t.timestamps
    end
  end
end
