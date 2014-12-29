class AddRateToHotels < ActiveRecord::Migration
  def change
    add_column :hotels, :rate, :integer
  end
end
