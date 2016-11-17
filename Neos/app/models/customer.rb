class Customer < ActiveRecord::Base
  validates :name, presence: true
  validates :address, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :cardno, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
