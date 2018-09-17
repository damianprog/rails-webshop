class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :brand
      t.float :price
      t.string :highlights
      t.string :description
    end
  end
end
