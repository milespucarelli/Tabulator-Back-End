class User < ApplicationRecord
  has_many :compositions
  has_secure_password
end
