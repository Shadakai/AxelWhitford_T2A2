class OrdersController < ApplicationController

  # Controller for cart/buying 

    def index 
        @line_items = current_user.cart.listings
    end

    def buy 
      # Get params data and populate line items
        Stripe.api_key = Rails.configuration.stripe[:secret_key]

        line_items = current_user.cart.listings.map do |listing|
            {
                price_data: {
                  currency: 'aud',
                  product_data: {
                    name: listing.title,
                  },
                  unit_amount: listing.price * 100,
                },
                quantity: 1,
              }
        end

        # Connect to stripe 

        session = Stripe::Checkout::Session.create({
            payment_method_types: ['card'],
            line_items: line_items,
            mode: 'payment',
            # These placeholder URLs will be replaced in a following step.
            success_url: success_url,
            cancel_url: cancel_url,
          })
        
          redirect_to session.url
        end

        # Success method

        def success
        end

        # Cancel method

        def cancel
        end

        # destroy cart

        def destroy
          @cart.destroy if @cart.id == session[:cart_id]
          session[:cart_id] = nil
        end

        # add listing item to cart

        def add_to_cart
            listing = Listing.find(params[:listing_id])
            current_user.cart.listings << listing
            flash[:notice] = 'Book added to cart'
            redirect_to listings_path
        end

        # add the item and go straight to checkout

        def buy_now
            listing = Listing.find(params[:listing_id])
            current_user.cart.listings << listing
            buy
        end
end
