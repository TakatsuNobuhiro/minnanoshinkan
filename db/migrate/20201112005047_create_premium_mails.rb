class CreatePremiumMails < ActiveRecord::Migration[6.0]
  def change
    create_table :premium_mails do |t|
      t.string :title
      t.text :message
      t.datetime :time

      t.timestamps
    end
  end
end
