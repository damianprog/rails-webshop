class CreateDeliveries < ActiveRecord::Migration[5.2]
  def change
    create_table :deliveries do |t|
      t.string :delivery_type
      t.float :delivery_cost
      t.string :delivery_date
      t.integer :order_id
    end
  end
end
