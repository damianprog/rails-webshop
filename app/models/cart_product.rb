class CartProduct < ApplicationRecord
  belongs_to :cart,optional: true
  belongs_to :product
  belongs_to :order,optional: true
end