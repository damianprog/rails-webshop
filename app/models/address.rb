class Address < ApplicationRecord
  belongs_to :user
  has_many :credit_cards
  has_many :orders, :class_name => 'Order', :foreign_key => 'address_id'
  has_many :payments, :class_name => 'Order', :foreign_key => 'billing_address_id'
end