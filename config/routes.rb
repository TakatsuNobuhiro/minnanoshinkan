Rails.application.routes.draw do
  resources :notifications, only: [:index, :destroy]
  resources :contacts, only: [:index]
  resources :premium_mails, only: [:new, :create]
  resources :events do 
    resources :comments, only: [:create, :destroy]
    resources :event_favorites, only: [:create, :destroy]
  end
  resources :clubs, only: [:index]
  resources :students, only: [:index]
  resources :charges, only: [:new, :create]


  resources :relationships, only: [:create, :destroy]

  devise_for :students, controllers: {
     :omniauth_callbacks => "omniauth_callbacks",
     sessions:      'students/sessions',
     passwords:     'students/passwords',
     registrations: 'students/registrations'     
  }
  root to: 'toppages#home'

  devise_for :clubs, controllers: {
    sessions:      'clubs/sessions',
    passwords:     'clubs/passwords',
    registrations: 'clubs/registrations'     
 }

  devise_scope :club do
    get '/clubs/sign_out' => 'devise/sessions#destroy'
    get '/clubs' => 'devise/registrations#destroy'
    post 'clubs/guest_sign_in', to: 'clubs/sessions#new_guest'
  end
  devise_scope :student do
    get '/students/sign_out' => 'devise/sessions#destroy'
    get '/students' => 'devise/registrations#destroy'
    post 'students/guest_sign_in', to: 'students/sessions#new_guest'
  end
  resources :students, only: [:show]
  resources :clubs, only: [:show] do
    resources :club_favorites, only: [:create,:destroy]
  end
end
