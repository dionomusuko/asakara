Rails.application.routes.draw do
  get 'chat_rooms/show'
  root 'home#index'

  resources :rooms do
    post 'add' => 'groups#create'
    delete '/add' => 'groups#destroy'
  end

  mount ActionCable.server => '/cable'
  # devise
  devise_scope :user do
    get "user/:id", :to => "users/registrations#detail"
    get "sign_up", :to => "users/registrations#new"
    get "sign_in", :to => "users/sessions#new"
    delete "sign_out", :to => "users/sessions#destroy"
  end
  devise_for :users, :controllers => {
      :registrations => 'users/registrations',
      :sessions => 'users/sessions'
  }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
