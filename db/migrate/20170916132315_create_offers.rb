class CreateOffers < ActiveRecord::Migration[5.1]
  def change
    create_table :offers do |t|
	  t.integer :listing
	  t.integer :price
	  t.integer :quantity
	  
	  t.belongs_to :order, index: true

      t.timestamps
    end
  end
end
