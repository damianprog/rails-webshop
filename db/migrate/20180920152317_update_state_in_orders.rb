class UpdateStateInOrders < ActiveRecord::Migration[5.2]
  def change
    change_column :orders,:state,:string,default: 'ongoing'
  end
end
