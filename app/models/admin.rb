class Admin < ActiveRecord::Base

	has_secure_password

	#Validations
	validates :username, presence:true, length:{in: 8..25}, uniqueness:true
	validates :first_name, :last_name, presence:true, length:{maximum: 25}

	#Scopes
	scope :webmasters, -> { where(type: 'Webmaster') } 
end
