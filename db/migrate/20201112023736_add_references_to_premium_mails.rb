class AddReferencesToPremiumMails < ActiveRecord::Migration[6.0]
  def change
    add_reference :premium_mails, :club, :null => false, :foreign_key => true
  end
end
