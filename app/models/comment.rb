class Comment < ApplicationRecord

    # Model for Comments

    belongs_to :listing
    belongs_to :user
end
