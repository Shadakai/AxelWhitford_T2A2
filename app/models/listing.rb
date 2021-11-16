class Listing < ApplicationRecord
    belongs_to :user
    has_many :comments, dependent: :destroy

    has_one_attached :potion_image
end
