class CreateItemsAndFlags < ActiveRecord::Migration[5.1]
  def change
    create_table :items_flags do |t|
	  t.belongs_to :item, index: true
      t.belongs_to :flag, index: true
    end
  end
end
