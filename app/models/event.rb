class Event < ActiveRecord::Base

	#Set the class as Abstract
	self.abstract_class = true

	#--------------------------------Validations----------------------------------
	#Validate title
	validates :title, presence:true, length:{maximum: 100}

	#validate colour, privacy nad repeat_type
	validates :colour, :privacy, :repeat_type, presence:true, length:{maximum: 15}

	#validate date, start_at and end_at
	validates :date, :start_at, :end_at, presence:true
	validates_datetime :start_at, :before => :end_at

	def format_start_time
		start_at.strftime("%H:%M")
	end
	
	def format_end_time
		end_at.strftime("%H:%M")
	end

	def duration
	    ((end_at-start_at)/3600).to_i
	end
end
