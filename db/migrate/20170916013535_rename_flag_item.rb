class RenameFlagItem < ActiveRecord::Migration[5.1]
  def change
	rename_table :flags_items, :i_flags_items
	rename_column :i_flags_items, :i_flags_id, :i_flag_id
	rename_column :i_flags_items, :items_id, :item_id
  end
end
