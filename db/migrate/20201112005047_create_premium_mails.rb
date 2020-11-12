class CreatePremiumMails < ActiveRecord::Migration[6.0]
  def change
    create_table :premium_mails do |t|
      t.string :title
      t.text :content
      t.datetime :time

      t.timestamps
    end
  end
end
