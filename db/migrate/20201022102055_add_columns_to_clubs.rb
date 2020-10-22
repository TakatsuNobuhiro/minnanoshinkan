class AddColumnsToClubs < ActiveRecord::Migration[6.0]
  def change
    add_column :clubs, :provider, :string
    add_column :clubs, :uid, :string
    add_column :clubs, :username, :string
  end
end
