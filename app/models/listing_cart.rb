class ListingCart < ApplicationRecord
  belongs_to :listing
  belongs_to :cart
end
