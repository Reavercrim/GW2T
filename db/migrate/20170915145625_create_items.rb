class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
	  t.integer :gid
	  t.string :name
	  t.string :chat_link
	  t.string :icon
	  t.integer :level
	  
	  t.belongs_to :rarity
	  t.belongs_to :i_type

      t.timestamps
    end
  end
end
