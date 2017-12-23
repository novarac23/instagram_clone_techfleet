require 'bcrypt'

class User < ApplicationRecord
  has_many :comments
  has_many :photos
  has_secure_password
end
