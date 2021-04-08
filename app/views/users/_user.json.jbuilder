json.extract! user, :id, :name, :emailAddress, :age, :created_at, :updated_at
json.url user_url(user, format: :json)
