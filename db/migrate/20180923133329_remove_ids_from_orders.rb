class RemoveIdsFromOrders < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders,:recipient_id
    remove_column :orders,:sender_id
  end
end
