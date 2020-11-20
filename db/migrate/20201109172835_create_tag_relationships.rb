class CreateTagRelationships < ActiveRecord::Migration[6.0]
  def change
    create_table :tag_relationships do |t|
      t.references :tag, :null => false, :foreign_key => true
      t.references :event, :null => false, :foreign_key => true

      t.timestamps
    end
    add_index :tag_relationships, %i[event_id tag_id], :unique => true
  end
end
