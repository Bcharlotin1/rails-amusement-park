Rails.application.routes.draw do
  resources :attractions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users

  get 'signin' => 'sessions#new' 
  post 'signin' => 'sessions#create'
  get 'signout' =>'sessions#destroy'
  
  root 'welcome#home'
end
