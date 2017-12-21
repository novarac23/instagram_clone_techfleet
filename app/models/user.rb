require 'bcrypt'

class User < ApplicationRecord
  has_many :comments
  has_many :photos
  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
  end
end
