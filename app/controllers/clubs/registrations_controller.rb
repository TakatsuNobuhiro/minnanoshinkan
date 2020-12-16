# frozen_string_literal: true

class Clubs::RegistrationsController < Devise::RegistrationsController # before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: %i[update]
  before_action :configure_account_create_params, only: %i[create]
  before_action :check_guest, only: %i[destroy]

  # GET /resource/sign_up
  def new
    set_category
    super
  end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  def update
    super
    if account_update_params[:avatar].present?
      resource.avatar.attach(account_update_params[:avatar])
    end
  end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  def update_resource(resource, params)
    resource.update_without_password(params)
  end # end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_create_params
    devise_parameter_sanitizer.permit(
      :sign_up,
      keys: %i[name category_id active]
    )
  end

  def configure_account_update_params
    devise_parameter_sanitizer.permit(
      :account_update,
      keys: %i[name sns home intercollege detail avatar]
    )
  end

  def after_sign_up_path_for(resource)
    edit_club_registration_path(resource)
  end

  def after_update_path_for(resource)
    club_path(resource)
  end # end
end
