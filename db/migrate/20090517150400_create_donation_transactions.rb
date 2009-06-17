class CreateDonationTransactions < ActiveRecord::Migration
  def self.up
    create_table :donation_transactions do |t|
      t.integer :donation_id
      t.string :action
      t.integer :amount
      t.boolean :success
      t.string :authorization
      t.string :message
      t.text :params

      t.timestamps
    end
  end

  def self.down
    drop_table :donation_transactions
  end
end
