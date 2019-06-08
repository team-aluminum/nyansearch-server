class CreateCats < ActiveRecord::Migration[5.2]
  def change
    create_table :cats do |t|
      t.integer :shop_id, null: false
      t.string :name

      t.timestamps
    end
  end
end
