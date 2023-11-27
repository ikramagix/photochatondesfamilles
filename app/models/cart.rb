class Cart < ApplicationRecord
  has_many :cart_items
  has_many :items, through: :cart_items
  belongs_to :user

  validates_uniqueness_of :user_id

end
