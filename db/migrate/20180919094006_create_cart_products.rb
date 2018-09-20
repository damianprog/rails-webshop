class CreateCartProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_products do |t|
      t.integer :product_id
      t.integer :quantity
      t.float :price
    end
  end
end
