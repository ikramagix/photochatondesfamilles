require "administrate/base_dashboard"

class ItemDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    name: Field::String,
    description: Field::Text,
    price: Field::Number.with_options(decimals: 2),
    image: CarrierwaveField,
    cart_items: Field::HasMany,
    carts: Field::HasMany,
    order_items: Field::HasMany,
    # Add other attributes here
  }.freeze

  FORM_ATTRIBUTES = [
    :name,
    :description,
    :price,
    :image,
  ].freeze

  COLLECTION_ATTRIBUTES = [
    :name,
    :description,
    :price,
    :image,
  ].freeze

  SHOW_PAGE_ATTRIBUTES = [
    :name,
    :description,
    :price,
    :image,
  ].freeze

  SEARCHABLE_ATTRIBUTES = [
    :name,
    :description,
  ].freeze
end