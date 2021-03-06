class User < ApplicationRecord
  has_many :orders
  has_many :credit_cards
  has_many :reviews,dependent: :destroy
  has_many :addresses,dependent: :destroy
  has_one :cart
  before_save {self.email = email.downcase}
  validates :username,presence: true,
            uniqueness: {case_sensitive: false },
            length: {minimum: 3,maximum:20}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email,presence: true,
            uniqueness: {case_sensitive: false},
            format: {with: VALID_EMAIL_REGEX}
  has_secure_password
end