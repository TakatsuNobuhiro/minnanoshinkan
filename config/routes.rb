Rails.application.routes.draw do
  root to: 'toppages#home'
  devise_for :clubs
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_scope :club do
    get '/clubs/sign_out' => 'devise/sessions#destroy'
  end
end
