class AddStatusToClub < ActiveRecord::Migration[6.0]
  def change
    add_column :clubs, :name, :string
    add_column :clubs, :university, :string
    add_column :clubs, :detail, :text
    add_column :clubs, :home, :text
    add_column :clubs, :sns, :text
    add_column :clubs, :intercollege, :boolean, :default => false
    add_column :clubs, :active, :boolean
  end
end
