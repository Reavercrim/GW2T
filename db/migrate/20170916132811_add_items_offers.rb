class AddItemsOffers < ActiveRecord::Migration[5.1]
  def change
	create_table :items_offers, id: false do |t|
		t.belongs_to :item, index: true
		t.belongs_to :offer,index: true	
	end
  end
end
