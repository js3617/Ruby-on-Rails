Rails.application.routes.draw do
	resources :articles do
		resources :comments, only: [:create]
	end
	
  resources :class_statuses
  resources :class_lists
  devise_for :users
  resources :tests
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
	
	root 'articles#index'
end
