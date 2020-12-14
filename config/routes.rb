Rails.application.routes.draw do
  resources :notifications, only: %i[index destroy]
  resources :contacts, only: %i[index]
  resources :premium_mails, only: %i[new create]
  resources :events do
    resources :comments, only: %i[create destroy]
    resources :event_favorites, only: %i[create destroy]
  end
  resources :clubs, only: %i[index]
  resources :students, only: %i[index]
  resources :charges, only: %i[new create]

  resources :relationships, only: %i[create destroy]

  devise_for :students,
             controllers: {
               omniauth_callbacks: 'omniauth_callbacks',
               sessions: 'students/sessions',
               passwords: 'students/passwords',
               registrations: 'students/registrations'
             } 

               
             

    

     
  root to: 'toppages#home'

  devise_for :clubs,
             controllers: {
               sessions: 'clubs/sessions',
               passwords: 'clubs/passwords',
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

  
  resources :students, only: %i[show]
  resources :students do
    get :club_likes, on: :member
    get :followings, on: :member
    get :followers, on: :member
  end
  resources :clubs, only: %i[show] do
    resources :club_favorites, only: %i[create destroy]
    get :student_likes, on: :member
  end
end
