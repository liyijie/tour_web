class CreateDishes < ActiveRecord::Migration
  def change
    create_table :dishes do |t|
      t.string :name
      t.integer :price
      t.references :shop, index: true

      t.timestamps
    end
  end
end
