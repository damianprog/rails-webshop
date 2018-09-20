class Order < ApplicationRecord
  belongs_to :user
  has_many :cart_products
  has_one :delivery,dependent: :destroy
end