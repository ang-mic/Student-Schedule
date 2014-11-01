class Society < User
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	#--------------------------------Validations---------------------------------
	validates :name, presence:true, length:{maximum: 50}, uniqueness:true
	validates :category, presence:true, length:{maximum: 50}

	#Associations
	has_many :user_events, :as => :eventable
end