class Order < ApplicationRecord
  has_many :order_items, dependent: :destroy
  belongs_to :user

  before_destroy :destroy_associated_records

  private

  def destroy_associated_records
    order_items.destroy_all
  end

  def self.create_from_cart(cart)
    order = create(user: cart.user)
    
    cart.cart_items.each do |cart_item|
      order.order_items.create(item: cart_item.item)
    end
    order
  end
end