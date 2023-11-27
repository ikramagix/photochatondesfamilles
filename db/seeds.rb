# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require "faker"

CartItem.destroy_all
OrderItem.destroy_all
Cart.destroy_all
Item.destroy_all
Order.destroy_all
User.destroy_all

users = []
5.times do
  users << User.create(
    email: Faker::Internet.email,
    password: "singes"
  )
end


items = []
10.times do
  items << Item.create(
    name: Faker::Commerce.product_name,
    description: Faker::Lorem.paragraph,
    price: Faker::Commerce.price,
    image_url: Faker::Internet.url
  )
end

carts = []
5.times do
  carts << Cart.create(
    total_price: Faker::Commerce.price,
    user: users.sample
  )
end


cart_items = []
10.times do
  cart_items << CartItem.create(
    cart: carts.sample,
    item: items.sample
  )
end


orders = []
3.times do
  orders << Order.create(
    total_price: Faker::Commerce.price,
    user: users.sample
  )
end

order_items = []
15.times do
  order_items << OrderItem.create(
    order: orders.sample,
    item: items.sample
  )
end