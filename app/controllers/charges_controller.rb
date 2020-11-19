class ChargesController < ApplicationController
  def new
  end
  
  def create
    # Amount in cents
    @amount = 30000
  
    customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
    })
  
    charge = Stripe::Charge.create({
      customer: customer.id,
      amount: @amount,
      description: 'Rails Stripe customer',
      currency: 'usd',
    })
    if current_club.update(premium: 1)
      redirect_to new_premium_mail_path
    end
  rescue Stripe::CardError => e
    flash[:danger] = e.message
    redirect_to new_charge_path
  end
end
