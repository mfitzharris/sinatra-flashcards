require 'bcrypt'

class User < ActiveRecord::Base

	has_many :entries

	validates :username, :email, :password_hash, :presence => true

	validates :username, :email, :uniqueness => true

	def password
		@password ||= BCrypt::Password.new(self.password_hash)
		@password
	end

	def password=(new_password)
		password = BCrypt::Password.create(new_password)
		self.password_hash = password
	end

	def authenticate(plain_text_password)
		self.password == plain_text_password
	end

end