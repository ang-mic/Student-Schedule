class UniversityEvent < Event

	#Callback
	after_initialize :set_default_params

	#Nested resource Location
	# accepts_nested_attributes_for :location

	#Validations
	validates :day, presence:true, length:{maximum: 20}
	validates :group, length:{maximum: 20}


	#Associations
	belongs_to :timetable
	belongs_to :course_module
	has_one :location, :as => :locationable

	#Nested resource Location
	accepts_nested_attributes_for :location

	#Scopes STI
	scope :lectures, -> { where(type: 'Lecture') } 
	scope :labs, -> { where(type: 'Lab') } 


	private
	 
	def set_default_params	
		self.title ||= "University Event"
 		self.colour ||= "#657fe6"
		self.privacy ||= "public"
		self.description ||= "This is a University Event"
	end

	
end
