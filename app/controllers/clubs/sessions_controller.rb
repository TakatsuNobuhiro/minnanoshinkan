# frozen_string_literal: true

class Clubs::SessionsController < Devise::SessionsController # before_action :configure_sign_in_params, only: [:create]
  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  def after_sign_in_path_for(resource)
    if resource.name.blank?
      edit_club_registration_path(resource)
    else
      club_path(resource)
    end
  end #guest_login

  def new_guest
    club = Club.guest
    sign_in club
    flash[:success] = 'ゲストユーザーとしてログインしました。'
    redirect_to club_path(club.id)
  end
end
