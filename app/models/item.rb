class Item < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :carts, through: :cart_items, dependent: :destroy
  has_many :order_items, dependent: :destroy
  has_many :orders, through: :order_items, dependent: :destroy
end
