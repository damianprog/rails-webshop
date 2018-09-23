class ChangeOrders < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders,:address_id
    remove_column :orders,:billing_address_id

    add_reference :orders,:address
    add_reference :orders,:billing_address

    add_foreign_key :orders,:addresses,column: :address_id,primary_key: :id;
    add_foreign_key :orders,:addresses,column: :billing_address_id,primary_key: :id;
  end
end
