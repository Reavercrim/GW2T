class RenameItemsFlags < ActiveRecord::Migration[5.1]
  def change
	rename_table :items_flags, :flags_items
  end
end
