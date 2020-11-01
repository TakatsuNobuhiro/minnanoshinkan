class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_student! # 追記 (userの部分はmodel名)
end
