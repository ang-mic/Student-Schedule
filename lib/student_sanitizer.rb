class Student::ParameterSanitizer < Devise::ParameterSanitizer
    private
    def sign_up
        default_params.permit(:profile_picture,:course_id,:email, :password, :password_confirmation,:first_name, :last_name, :student_number, :level, :date_of_birth, :telephone_number)
    end
    
    def account_update
        default_params.permit(:profile_picture,:course_id,:email, :password, :password_confirmation,:current_password,:first_name, :last_name, :student_number, :level, :date_of_birth, :telephone_number)
    end
end