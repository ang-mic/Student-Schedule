class Location < ActiveRecord::Base

	#--------------------------------Validations----------------------------------
	validates :address, presence:true

	#Associations
	belongs_to :locationable, :polymorphic => true

	#geocoder
	geocoded_by :address
	after_validation :geocode, :if => :address_changed?

end
