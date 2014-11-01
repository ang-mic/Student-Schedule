class User < ActiveRecord::Base
	
	#Set the class as Abstract
	self.abstract_class = true

	#Validations
	# validates :password, presence:true, length:{in: 8..25}
	# validates :email, presence:true, length:{in: 8..25}, uniqueness:true
	
end
