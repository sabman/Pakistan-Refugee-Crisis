require "#{Rails.root}/spec/blueprints" # or wherever they live 

class AddSomeStories < ActiveRecord::Migration
  def self.up
    Story.make( :user => User.make(:shoaib) )
  end

  def self.down
    Story.delete_all
    User.delete_all
  end
end
