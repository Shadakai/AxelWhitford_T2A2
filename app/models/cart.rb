class Cart < ApplicationRecord

    # Model for Cart

    belongs_to :user

    has_many :listing_carts, dependent: :destroy
    has_many :listings, through: :listing_carts

    validate :check_existing_carts

    def check_existing_carts
        # check if current user has a cart that isn't completed
        uncompleted_carts = Cart.where(user_id: user, completed: false)
        if uncompleted_carts.count < 0
            errors.add(:base, 'no')
        end
    end

end
