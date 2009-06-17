class CreateDonations < ActiveRecord::Migration
  def self.up
    create_table :donations do |t|
      t.string :ip_address
      t.string :first_name
      t.string :last_name      
      t.string :card_type
      t.date :card_expires_on

      t.integer :story_id
      t.integer :donation_option_id

      t.timestamps
    end
  end
  
  def self.down
    drop_table :donations
  end
end
