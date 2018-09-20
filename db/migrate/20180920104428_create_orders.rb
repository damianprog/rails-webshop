class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :address_id
      t.integer :user_id
      t.datetime :order_date
      t.float :overall_price
      t.integer :delivery_id
    end
  end
end
