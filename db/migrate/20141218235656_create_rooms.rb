class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.references :hotel
      t.string :name
      t.float :price
      t.string :area
      t.string :floor
      t.string :bed

      t.timestamps
    end
  end
end
