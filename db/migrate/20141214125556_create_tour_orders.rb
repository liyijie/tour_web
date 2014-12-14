class CreateTourOrders < ActiveRecord::Migration
  def change
    create_table :tour_orders do |t|
      t.float :total_price
      t.string :state
      t.integer :number
      t.references :user, index: true
      t.references :ticket, index: true
      t.string :token

      t.timestamps
    end
  end
end
