class Order < ApplicationRecord
  has_many :order_items
  has_many :items, through: :order_items
  belongs_to :user

  def self.create_from_cart(cart)
    order = create(user: cart.user)
    
    cart.cart_items.each do |cart_item|
      order.order_items.create(item: cart_item.item)
    end
    order
  end
end