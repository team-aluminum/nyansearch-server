class CreateShops < ActiveRecord::Migration[5.2]
  def change
    create_table :shops do |t|
      t.string :name
      t.text :address
      t.string :longitude
      t.string :latitude
      t.text :url

      t.timestamps
    end
  end
end
