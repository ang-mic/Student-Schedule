class Department < ActiveRecord::Base

	#--------------------------------Validations----------------------------------
	validates :name, presence:true, length:{maximum: 50}, uniqueness:true
	validates :school, presence:true, length:{maximum: 50}

	#Associations
	has_many :courses, :dependent =>:destroy
end
