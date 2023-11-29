class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :cart, dependent: :destroy
  has_many :orders, dependent: :destroy

  after_create :create_user_cart

  def destroy_with_associations
    transaction do
      order_items.destroy_all
      destroy!
    end
  end

  private 

  def create_user_cart
    Cart.create(user: self)
  end
end