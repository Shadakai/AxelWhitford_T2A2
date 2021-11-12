class Listing < ApplicationRecord
    belongs_to :user

    has_one_attached :potion_image
end
