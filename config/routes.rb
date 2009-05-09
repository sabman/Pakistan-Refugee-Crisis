ActionController::Routing::Routes.draw do |map|

  map.signup  'signup', :controller => "users",     :action => "new"
  map.login   'login',  :controller => "sessions",  :action => "new"
  map.logout  'logout', :controller => "sessions",  :action => "destroy"
  map.root    :controller => "stories",  :action => "index" 

  map.resource :users
  map.resource :sessions

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing the them or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
