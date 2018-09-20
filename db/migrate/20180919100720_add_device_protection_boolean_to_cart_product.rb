class AddDeviceProtectionBooleanToCartProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :cart_products,:device_protection,:boolean
  end
end
