Sham.define do
  title { Faker::Lorem.sentence }
  body { Faker::Lorem.paragraph }
  username  { Faker::Name.first_name }
  email { Faker::Internet.email }
  password { 'password' }  
  password_confirmation { 'password' }    
end

Story.blueprint do
  title
  body
end

User.blueprint do
  username
  email
  password
end 
