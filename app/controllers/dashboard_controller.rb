class DashboardController < ApplicationController

  layout 'test'

  before_action :deny_to_eventable
  before_action :find_eventable

  def index
    today_events
  end

  private
  #
  # def find_eventable
  #   if student_signed_in?
  #     @eventable = current_student
  #   elsif society_signed_in?
  #     @eventable = current_society
  #   end
  # end
  def today_events
    @dayly_by_date = current_student.user_events.group_by { |event| event.date.to_date }
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
  end

  # def upcoming_events
  #   @user_events = current_student.user_events
  #   @events_by_date = @user_events.group_by { |event| event.date.to_date }
  # end

  def find_eventable
    if student_signed_in?
      @eventable = current_student
    elsif society_signed_in?
      @eventable = current_society
    end
  end

  def deny_to_eventable
    redirect_to root_url unless student_signed_in? or society_signed_in?
  end

end
