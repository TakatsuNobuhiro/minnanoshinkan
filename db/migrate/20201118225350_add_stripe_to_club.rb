class AddStripeToClub < ActiveRecord::Migration[6.0]
  def change
    add_column :clubs, :premium, :integer, default: 0
  end
end
