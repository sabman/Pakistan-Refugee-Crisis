Given /^I am not logged in$/ do
  delete '/sessions', :user_id => @current_user
end
