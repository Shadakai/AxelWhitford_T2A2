class Listing < ApplicationRecord
    belongs_to :user, dependent: :destroy
end
