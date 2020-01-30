Rails.application.routes.draw do

root 'home#top'
  get 'home/about'
  delete 'books' => "books#delete"
  get 'relationships/index' => 'relationships#index', as: 'index_relationships'
  get 'searchs/search' => 'searchs#search', as: 'search'
  get 'searchs/form' => 'searchs#form', as: 'form'

  devise_for :users
  resources :users,only: [:show,:index,:edit,:update,:delete]
  resources :relationships, only: [:show,:edit,:create, :destroy]

  resources :books do
  	 resource :favorites, only: [:create, :destroy]
  	 resource :book_comments, only: [:create, :destroy]
  	end

end
