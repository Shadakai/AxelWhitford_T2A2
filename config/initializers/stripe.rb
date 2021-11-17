Rails.configuration.stripe = {
    :publishable_key => ENV['STRIPE_API_KEY'],
    :secret_key => ENV['STRIPE_API_SECRET']
}