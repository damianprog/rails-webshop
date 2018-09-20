class CreateOrderIdInDeliveries < ActiveRecord::Migration[5.2]
  def change
    add_column :deliveries,:order_id,:integer
  end
end
