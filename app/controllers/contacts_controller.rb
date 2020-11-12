class ContactsController < ApplicationController
  def index
    if params[:email].present?
      @contact=params    
      ContactMailer.contact_mail(@contact).deliver_now    
      flash[:success] = 'お問い合わせを受け付けました'
      redirect_to root_path
    end
    
  end
end
