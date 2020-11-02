Rails.application.routes.draw do

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
end
