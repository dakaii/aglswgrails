class UserSerializer
  include FastJsonapi::ObjectSerializer
  set_type :user
  attributes :token, :email, :name, :created_at, :updated_at
end
