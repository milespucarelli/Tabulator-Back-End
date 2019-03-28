class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :password_digest, :email, :bio, :image

  has_many :compositions
end
