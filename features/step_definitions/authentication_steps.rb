Given /^I am logged out in$/ do
  delete '/user_sessions', :user_id => @current_user
end

When(/^I login with "(\S+)", "(.*)"$/) do |username, password|
  When "I go to the new user_session page"
  fill_in 'username', :with => username 
  fill_in 'password', :with => password
  click_button 'Sign in'
end

Given "I am logged in" do
  me = User.make(:shoaib)
  When "I login with \"#{me.username}\", \"secret\""
  Then "I should see \"Successfully logged in.\""
end
