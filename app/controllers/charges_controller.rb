class ChargesController < ApplicationController
  def new; end

  def create
    @amount = 30_000

    customer =
      Stripe::Customer.create(
        { :email => params[:stripeEmail], :source => params[:stripeToken] }
      )

    charge =
      Stripe::Charge.create(
        {
          :customer => customer.id,
          :amount => @amount,
          :description => 'Rails Stripe customer',
          :currency => 'usd'
        }
      )
    redirect_to new_premium_mail_path if current_club.update(:premium => 1)
  rescue Stripe::CardError => e
    flash[:danger] = e.message
    redirect_to new_charge_path
  end # Amount in cents
end
