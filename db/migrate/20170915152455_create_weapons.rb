class CreateWeapons < ActiveRecord::Migration[5.1]
  def change
    create_table :weapons do |t|
      t.belongs_to :weapon_type, index: true
      t.belongs_to :item, index: true

      t.timestamps
    end
  end
end
