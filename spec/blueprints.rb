require "faker"

Sham.define do
  title { Faker::Lorem.sentence }
  body { Faker::Lorem.paragraph }
  username  { Faker::Name.first_name }
  email { Faker::Internet.email }           
  password { 'secret' }  
  password_confirmation { 'secret' }      
end    


# User
User.blueprint do
  username
  email
  password {"secret"}
end 

User.blueprint(:shoaib) do
  username { "shoaib" } 
  email {"shoaib@nomad-labs.com"}
  password {"secret"}
  password_confirmation {"secret"}
  admin {false}
end


User.blueprint(:admin) do
  username {"admin"}
  email {"saburq@gmail.com"}
  password {"secret"}
  password_confirmation {"secret"}
  admin {true}    
  # story {Story.make}
end

# Story
Story.blueprint do
  title
  body
end

Story.blueprint("shoaibs_story") do
  user {User.make(:shoaib) }
end

# DonationOption
DonationOption.blueprint do
  title
  description {Faker::Lorem.paragraph}
  amount {rand(50)}
end

