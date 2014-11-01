class Student < User
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
  	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

    #Profile picture configuration and validation
	has_attached_file :profile_picture, :styles => { :small => "100x100#", :medium => "300x300#",:large => "600x600#" },
					  :default_url => "/images/:style/missing.png"

	validates_attachment_content_type :profile_picture, :content_type => ['image/jpeg', 'image/png']
	validates_attachment_size :profile_picture, :less_than => 5.megabytes

	#Validations
	validates :first_name, :last_name, presence:true, length:{maximum: 25}
	validates :student_number, presence:true,length:{maximum: 15}
	validates :telephone_number, length:{maximum: 25}
	validates :level, presence: true, :inclusion => {:in => 0..4}

	validates_date :date_of_birth, :before => Date.today

	#Associations
	has_many :user_events, :as => :eventable
	belongs_to :course
	has_many :timetables, :through => :course

	def full_name
    	"#{first_name} #{last_name}"
  end

end
