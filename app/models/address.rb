class Address < ApplicationRecord
  belongs_to :user
  has_many :orders
  has_many :credit_cards
end