Rails.application.routes.draw do

  get 'premium_mails/new'
  get 'premium_mails/create'
  resources :events do 
    resources :comments, only: [:create, :destroy]
    resources :event_favorites, only: [:create, :destroy]
  end
  resources :clubs, only: [:index]
  


  resources :relationships, only: [:create, :destroy]
  get 'students/show'
  get 'students/index'
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
  end
  devise_scope :student do
    get '/students/sign_out' => 'devise/sessions#destroy'
    get '/students' => 'devise/registrations#destroy'
  end

  resources :clubs, only: [:show] do
    resources :club_favorites, only: [:create,:destroy]
  end
end
