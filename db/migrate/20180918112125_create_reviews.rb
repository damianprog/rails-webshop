class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :title
      t.string :review
      t.integer :user_id
      t.integer :product_id
      t.datetime :created_at
    end
  end
end
