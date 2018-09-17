class UpdateProductFields < ActiveRecord::Migration[5.2]
  def change
    add_column :products,:brand,:string
    add_column :products,:price,:float
    add_column :products,:highlights,:string
    add_column :products,:description,:string
  end
end
