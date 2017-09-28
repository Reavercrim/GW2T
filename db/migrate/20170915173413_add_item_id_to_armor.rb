class AddItemIdToArmor < ActiveRecord::Migration[5.1]
  def change
   add_reference :armors, :item, index: true, foreign_key: true
  end
end
