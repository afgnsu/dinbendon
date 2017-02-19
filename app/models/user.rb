class User < ApplicationRecord
  # rails 內建的使用者認證方法，需要搭配 bcrypt gem 使用
  has_secure_password validation: false

  has_many :comments
end
