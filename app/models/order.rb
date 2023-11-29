class Order < ApplicationRecord
  has_many :order_items, dependent: :destroy
  belongs_to :user

  before_destroy :destroy_associated_records
  after_create :clear_cart_after_order

  private

  def destroy_associated_records
    order_items.destroy_all
  end

  def self.create_from_cart(cart)
    order = create(user: cart.user)
    
    cart.cart_items.each do |cart_item|
      order.order_items.create(item: cart_item.item)
    end
    order.update(total_price: cart.total_price)
    order
    cart.cart_items.destroy_all
  end

  def clear_cart_after_order
    cart = Cart.find_by(user_id: self.user_id)
    cart&.cart_items&.clear
    cart&.update(total_price: nil)
  end
end