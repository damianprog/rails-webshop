class DeleteNameFromProductImages < ActiveRecord::Migration[5.2]
  def change
    remove_column :product_images,:name
  end
end
