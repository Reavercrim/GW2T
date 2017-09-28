class RenameListingToListings < ActiveRecord::Migration[5.1]
  def change
	rename_column :offers, :listing, :listings
  end
end
