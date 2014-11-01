class Course < ActiveRecord::Base
	
	#--------------------------------Validations------------------------------------------
	validates :title, presence:true, length:{maximum: 100}
	validates :code, presence:true, length:{maximum: 15}, uniqueness:true
	validates :short_title, :category,  presence:true, length:{maximum: 15}
	validates :number_of_levels, presence: true, :inclusion => {:in => 1..4}

	#Associations
	has_many :students
	has_many :course_modules, :dependent =>:destroy
	has_many :timetables,  :dependent =>:destroy
	belongs_to :department
	#has_and_belongs_to_many :course_modules

	#Nested resource CourseModule
	accepts_nested_attributes_for :course_modules, allow_destroy: true
end
