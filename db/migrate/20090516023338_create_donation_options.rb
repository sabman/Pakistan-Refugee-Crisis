class CreateDonationOptions < ActiveRecord::Migration
  def self.up
    create_table :donation_options do |t|
      t.string :title
      t.string :description
      t.integer :amount
      t.timestamps
    end
    DonationOption.create!(
        :title => "Small change", 
        :description => "If enough people give up a bit of small change we can make a big change", 
        :amount => 1)
    DonationOption.create!(
        :title => "Jingle, jingle", 
        :description => "So you feel you have more than just small change to spare", 
        :amount => 5) 
    DonationOption.create!(
        :title => "Phylantorpist", 
        :description => "Rolling in it? What are you waiting for then?", 
        :amount => 10)        
  end
  
  def self.down
    DonationOption.delete_all
    drop_table :donation_options
  end
end
