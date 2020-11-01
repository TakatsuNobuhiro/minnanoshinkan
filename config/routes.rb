Rails.application.routes.draw do
  devise_for :students
  root to: 'toppages#home'
  devise_for :clubs
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_scope :club do
    get '/clubs/sign_out' => 'devise/sessions#destroy'
    get '/clubs' => 'devise/registrations#destroy'
  end
  devise_scope :student do
    get '/students/sign_out' => 'devise/sessions#destroy'
    get '/students' => 'devise/registrations#destroy'
  end
end
