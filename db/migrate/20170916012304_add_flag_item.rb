class AddFlagItem < ActiveRecord::Migration[5.1]
  def change
	create_table :flags_items, id: false do |t|
		t.belongs_to :i_flags, index: true
		t.belongs_to :items, index: true
	end
  end
end
