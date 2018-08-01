class Contractor < ApplicationRecord

  before_create :generate_token
  before_create :generate_uuid
  before_save { self.email = email.downcase }
  has_secure_password

  has_many :accounts

  private
	def generate_token
		val = self.name + self.email + self.password_digest
		self.access_token = BCrypt::Password.create(val)
	end
	
	def generate_uuid
		self.uuid = SecureRandom.uuid
	end
  
end
