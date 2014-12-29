class AddCityToShop < ActiveRecord::Migration
  def change
    add_reference :shops, :city, index: true
  end
end
