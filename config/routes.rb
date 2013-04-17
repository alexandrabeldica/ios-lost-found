IOSLostFound::Application.routes.draw do
  match '/lfitem/new', :to => 'lfitem#new' 
  match '/categories', :to => 'lfitem#get_categories'
  match '/items/:id_category/:lftype', :to => 'lfitem#get_items'
  match '/item/:id', :to => 'lfitem#get_item'
end
