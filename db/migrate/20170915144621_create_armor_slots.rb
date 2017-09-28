class CreateArmorSlots < ActiveRecord::Migration[5.1]
  def change
    create_table :armor_slots do |t|
      t.string :name

      t.timestamps
    end
  end
end
