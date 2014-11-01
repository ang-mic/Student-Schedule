class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :daily_events

  before_filter :configure_devise_params, if: :devise_controller?

  def configure_devise_params
    devise_parameter_sanitizer.for(:edit) do |student|
      student.permit(:profile_picture,:course_id,:email, :password, :password_confirmation,:current_password,:first_name, :last_name, :student_number, :level, :date_of_birth, :telephone_number)
    end
  end

  # before_filter :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    # user_events_path
    user_events_path
  end

  def after_sign_out_path_for(resource_or_scope)
    new_student_session_path
  end

  protected

  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.for(:sign_up) << :first_name
  # end

  def devise_parameter_sanitizer
    if resource_class == Student
      Student::ParameterSanitizer.new(Student, :student, params)
    else
      Society::ParameterSanitizer.new(Society, :society, params)
    end
  end

  def daily_events(user)
    daily_events = user.user_events.where(date: Date.today)
    return daily_events.size
  end

end
