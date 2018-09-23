class CreateCreditCards < ActiveRecord::Migration[5.2]
  def change
    create_table :credit_cards do |t|
      t.string :first_name
      t.string :last_name
      t.string :card_number
      t.string :month_expiration
      t.string :year_expiration
      t.string :security_code
      t.string :phone_number
      t.integer :user_id
      t.integer :address_id
    end
  end
end
