class CreateListingCarts < ActiveRecord::Migration[6.1]
  def change
    create_table :listing_carts do |t|
      t.references :listing, null: false, foreign_key: true
      t.references :cart, null: false, foreign_key: true

      t.timestamps
    end
  end
end
