class User < ApplicationController
  attr_accessor :password_hash
  validates_confirmation_of :password
  validates :username, :presence => true, :uniqieness => true
  before_save :encrypt_password

  def encrypt_password
    self.password_salt = BCrypt::Engine.generate_salt
    self.password_hash = BCrypt::Engine.hash_secret(password,password_salt)
  end

  def self.authenticate(user_name, password)
    user = User.find_id "user_name = ?", user_name
    if user && user.password_salt == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end
end

