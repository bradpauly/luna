ActionController::Routing::Routes.draw do |map|
  map.resources :comments
  map.resources :posts
  
  map.root :controller => 'site'
  map.connect '/rss.xml', :controller => 'site', :action => 'rss'
  
  map.connect ':action', :controller => 'site'
  map.connect ':section/:action', :controller => 'site'
  
  map.login 'login', :controller => 'site', :action => 'login'
  map.logout 'logout', :controller => 'site', :action => 'logout'
  
  map.connect ':year/:month/:day/:id', :controller => 'site', :action => 'post'
end
