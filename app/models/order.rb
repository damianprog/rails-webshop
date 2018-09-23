class Order < ApplicationRecord
  belongs_to :user
  has_many :cart_products
  belongs_to :address, :class_name => 'Address',optional: true
  belongs_to :billing_address, :class_name => 'Address',optional: true
  belongs_to :credit_card,optional: true
  belongs_to :delivery,dependent: :destroy
end