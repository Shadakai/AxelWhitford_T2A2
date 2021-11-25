class Listing < ApplicationRecord

    # Model for Listing

    is_impressionable

    belongs_to :user
    has_many :comments, dependent: :destroy
    has_many :listing_carts, dependent: :destroy
    has_many :carts, through: :listing_carts

    has_one_attached :potion_image
end
