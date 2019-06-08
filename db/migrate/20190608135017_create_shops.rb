class CreateShops < ActiveRecord::Migration[5.2]
  def change
    create_table :shops do |t|
      t.string :name
      t.string :position_x
      t.string :position_y
      t.string :url

      t.timestamps
    end
  end
end
