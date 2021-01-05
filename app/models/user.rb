class User < ApplicationRecord
  has_secure_password
  
  attr_accessor :email, :username, :password, :password_confirmation
  
  validates_uniqueness_of :email, :username
end
