class CreateIFlags < ActiveRecord::Migration[5.1]
  def change
    create_table :i_flags do |t|
      t.string :name

      t.timestamps
    end
  end
end
