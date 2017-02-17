json.extract! order, :id, :name, :email, :description, :age, :created_at, :updated_at
json.url order_url(order, format: :json)