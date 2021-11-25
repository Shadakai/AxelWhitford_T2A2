class ListingCart < ApplicationRecord

  # Model for thorugh table for Listing and Cart
  
  belongs_to :listing
  belongs_to :cart
end
