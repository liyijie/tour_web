class AddOrderInfoToTourOrder < ActiveRecord::Migration
  def change
    add_column :tour_orders, :outdate, :date
    add_column :tour_orders, :user_phone, :string
    add_column :tour_orders, :user_name, :string
  end
end
