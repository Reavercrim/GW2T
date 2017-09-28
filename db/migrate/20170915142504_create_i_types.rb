class CreateITypes < ActiveRecord::Migration[5.1]
  def change
    create_table :i_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
