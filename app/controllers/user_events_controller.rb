class UserEventsController < ApplicationController

  layout 'test'

  before_action :set_user_event, only: [:show, :edit, :update, :destroy]
  before_action :deny_to_eventable
  before_action :find_eventable
  # before_action :publisher
  # GET /user_events
  # GET /user_events.json
  def index
    @user_events = @eventable.user_events
    @events_by_date = @user_events.group_by { |event| event.date.to_date }
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
  end

  # GET /user_events/1
  # GET /user_events/1.json
  def show
  end

  # GET /user_events/new
  def new
    @user_event = UserEvent.new
    @user_event.build_location
  end

  # GET /user_events/1/edit
  def edit
  end

  # POST /user_events
  # POST /user_events.json
  def create

    @user_event = UserEvent.new(user_event_params)
    @user_event.eventable = @eventable

    respond_to do |format|
      if @user_event.save
        format.html { redirect_to user_events_path, notice: 'User event was successfully created.' }
        format.json { render action: 'show', status: :created, location: @user_event }
      else
        format.html { render action: 'new' }
        format.json { render json: @user_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_events/1
  # PATCH/PUT /user_events/1.json
  def update

    respond_to do |format|
      if @user_event.update(user_event_params)
        format.html { redirect_to user_events_path, notice: 'User event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_events/1
  # DELETE /user_events/1.json
  def destroy
    @user_event.destroy
    respond_to do |format|
      format.html { redirect_to user_events_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_event
      @user_event = UserEvent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_event_params
      params.require(:user_event).permit(:eventable_id, :title, :date, :start_at, :end_at, :repeat_type, :repeat_frequency, :colour, :privacy, :description, location_attributes: [:id, :address, :latitude, :longitude])
    end

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
