class AddListingIdToComments < ActiveRecord::Migration[6.1]
  def change
    add_column :comments, :listing_id, :integer
  end
end
