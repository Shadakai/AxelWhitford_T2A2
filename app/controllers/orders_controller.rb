class OrdersController < ApplicationController
    def buy 
        listing = Listing.find(params[:listing_id])

        Stripe.api_key = Rails.configuration.stripe[:secret_key]

        session = Stripe::Checkout::Session.create({
            payment_method_types: ['card'],
            line_items: [{
              price_data: {
                currency: 'aud',
                product_data: {
                  name: listing.title,
                },
                unit_amount: listing.price * 100,
              },
              quantity: 1,
            }],
            mode: 'payment',
            # These placeholder URLs will be replaced in a following step.
            success_url: success_url,
            cancel_url: cancel_url,
          })
        
          redirect_to session.url
        end

        def success
        end

        def cancel
        end

        def add_to_cart
            listing = Listing.find(params[:listing_id])
            current_user.cart.listings << listing
            flash[:notice] = 'Book added to cart'
            redirect_to listing_path
        end
end
