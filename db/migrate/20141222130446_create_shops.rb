class CreateShops < ActiveRecord::Migration
  def change
    create_table :shops do |t|
      t.string :name
      t.string :addr
      t.string :tel
      t.text :special
      t.string :work_range
      t.float :price_avg

      t.timestamps
    end
  end
end
