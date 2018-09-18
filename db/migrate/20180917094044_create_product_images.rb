class CreateProductImages < ActiveRecord::Migration[5.2]
  def change
    create_table :product_images do |t|
      t.string :name
      t.string :picture
      t.references :product,index: true,foreign_key: true
    end
  end
end