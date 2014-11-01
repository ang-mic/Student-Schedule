class UserEvent < Event

	#Associations
	has_one :location, :as => :locationable
	belongs_to :eventable, :polymorphic => true

	#Nested resource Location
	accepts_nested_attributes_for :location

end
