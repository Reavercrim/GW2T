class DropFlagsItems < ActiveRecord::Migration[5.1]
  def change
    drop_table :flags_items
  end
end
