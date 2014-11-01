class Timetable < ActiveRecord::Base
	
	#Validations
	validates :level, presence: true, :inclusion => {:in => 0..4}
	validates :level, presence: true, :inclusion => {:in => 1..3}
	validates :academic_year, presence:true, length:{maximum: 20}

	validates :start_at, :end_at, presence:true
	validates_date :start_at, :before => :end_at



	#Associations
	belongs_to :course
	has_many :students, :through => :course
	has_many :university_events

	#Delegate
	delegate :lectures, :labs, to: :university_events

	def format_start_date
		start_at.strftime("%d-%m-%Y")
  	end

  	def format_end_date
		end_at.strftime("%d-%m-%Y")
  	end
end
