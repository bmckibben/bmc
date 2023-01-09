Rails.application.routes.draw do

  root "home#index"
  
  get 'wikis/wiki_form' => 'wikis#wiki_form'
  get 'wikis/re_display' => 'wikis#re_display'
  get 'wikis/test' => 'wikis#test'
  get 'wikis/wikilist' => 'wikis#wikilist'
  get 'wikis/search' => 'wikis#search'
  post 'wiki_tags/delete_wiki_tag' => 'wiki_tags#delete_wiki_tag'
  post 'wikis/wiki_disable' => 'wikis#wiki_disable'
  post 'wiki_tags/new_wiki_tag' => 'wiki_tags#new_wiki_tag'
  get 'wiki_tags/menu' => 'wiki_tags#menu'

  resources :wikis
  resources :wiki_tags
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")

	get "home/home", to: "home#home", as: :home_home
  post "home/contact(.:format)", to: "home#contact", as: :contact  
end
