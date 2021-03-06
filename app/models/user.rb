require 'bcrypt'

class User < ActiveRecord::Base
	has_many :entries 
	has_many :rounds
	has_many :decks_played, through: :rounds, source: :deck
	has_many :guesses, through: :rounds 
	
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