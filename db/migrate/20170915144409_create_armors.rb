class CreateArmors < ActiveRecord::Migration[5.1]
  def change
    create_table :armors do |t|
      t.belongs_to :armor_slot, index: true
      t.belongs_to :weight_class, index: true
      t.belongs_to :item, index: true

      t.timestamps
    end
  end
end
