class Cart < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :items, through: :cart_items
  belongs_to :user

  validates_uniqueness_of :user_id, scope: :user_id

end
