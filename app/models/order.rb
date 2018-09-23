class Order < ApplicationRecord
  belongs_to :user
  belongs_to :address,optional: true
  has_many :cart_products
  belongs_to :credit_card,optional: true
  belongs_to :delivery,dependent: :destroy
end