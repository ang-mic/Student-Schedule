class CourseModule < ActiveRecord::Base

	#--------------------------------Validations----------------------------------
	validates :code, :lecturer, presence:true, length:{maximum: 25}
	validates :title, presence:true, length:{maximum: 100}
	validates :code, presence:true, length:{maximum: 15}, uniqueness:true
	validates :level, presence: true, :inclusion => {:in => 0..4}

	#Associations
	# has_and_belongs_to_many :courses
	belongs_to :course
	has_many :university_events
end
