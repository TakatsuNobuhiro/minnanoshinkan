class AddColumnsToEvent < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :start, :datetime
    add_column :events, :end, :datetime
  end
end
