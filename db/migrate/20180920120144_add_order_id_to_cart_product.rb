class AddOrderIdToCartProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :cart_products,:order_id,:integer
  end
end
