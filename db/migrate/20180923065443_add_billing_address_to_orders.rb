class AddBillingAddressToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders,:billing_address_id,:integer
  end
end
