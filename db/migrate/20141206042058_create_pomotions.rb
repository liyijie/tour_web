class CreatePomotions < ActiveRecord::Migration
  def change
    create_table :pomotions do |t|
      t.string :title
      t.string :sub_title
      t.text :content
      t.integer :rate
      t.references :category, index: true

      t.timestamps
    end
  end
end
