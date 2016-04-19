json.array!(@users) do |user|
  json.extract! user, :id, :name, :email, :password, :role_id, :admin
  json.url user_url(user, format: :json)
end
