IOSLostFound::Application.routes.draw do
  match '/lfitem/new', :to => 'lfitem#new' 
  match '/categories', :to => 'lfitem#get_categories'
  match '/items/:lftype', :to => 'lfitem#get_items'
end
