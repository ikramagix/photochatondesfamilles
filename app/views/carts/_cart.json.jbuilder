json.extract! cart, :id, :total_price, :user_id, :created_at, :updated_at
json.url cart_url(cart, format: :json)
