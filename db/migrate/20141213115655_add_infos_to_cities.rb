class AddInfosToCities < ActiveRecord::Migration
  def change
    add_column :cities, :traffic, :text
    add_column :cities, :note, :text
    add_column :cities, :history, :text
    add_column :cities, :special_product, :text
  end
end
