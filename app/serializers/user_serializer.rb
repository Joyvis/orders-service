class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :identification_document, :email
  has_many :orders
end
