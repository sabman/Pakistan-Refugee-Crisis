ActionController::Routing::Routes.draw do |map|
  map.signup  'signup', :controller => "users",     :action => "new"
  map.login   'login',  :controller => "user_sessions",  :action => "new"
  map.logout  'logout', :controller => "user_sessions",  :action => "destroy"

  map.resource :account, :controller => "users"
  map.resources :users
  map.resources :user_sessions
  map.resources :stories
  map.root    :controller => "stories",  :action => "index" 


  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing the them or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
