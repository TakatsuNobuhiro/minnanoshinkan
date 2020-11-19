if Rails.env.development? || Rails.env.test?
  Rails.configuration.stripe = {
    :publishable_key => ENV['STRIPE_PUBLISHABLE_KEY_TEST'],
    :secret_key      => ENV['STRIPE_SECRET_KEY_TEST']
  }
end

if Rails.env.production?
  Rails.configuration.stripe = {
    :publishable_key => ENV['STRIPE_PUBLISHABLE_KEY'],
    :secret_key      => ENV['STRIPE_SECRET_KEY']
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]