class UniversityEventsController < ApplicationController

  before_action :set_university_event, only: [:show, :edit, :update, :destroy]
  before_action :find_timetable

  # GET /university_events
  # GET /university_events.json
  def index
    @university_events = @timetable.university_events
  end

  # GET /university_events/1
  # GET /university_events/1.json
  def show
  end

  # GET /university_events/new
  def new
    @university_event = UniversityEvent.new
    @university_event.build_location
  end

  # GET /university_events/1/edit
  def edit
    # @course_modules = @university_event.timetable.course.course_modules.collect{|m| [m.code + " | " + m.title, m.id]}
    # CourseModule.all.collect{|m| [m.code + " | " + m.title, m.id]}
  end

  # POST /university_events
  # POST /university_events.json
  def create
    @university_event = UniversityEvent.new(university_event_params)
    @university_event.timetable_id = @timetable.id

    respond_to do |format|
      if @university_event.save
        format.html { redirect_to @timetable, notice: 'University event was successfully created.' }
        format.json { render action: 'show', status: :created, location: @university_event }
      else
        format.html { render action: 'new' }
        format.json { render json: @university_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /university_events/1
  # PATCH/PUT /university_events/1.json
  def update
    respond_to do |format|
      if @university_event.update(university_event_params)
        format.html { redirect_to @timetable, notice: 'University event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @university_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /university_events/1
  # DELETE /university_events/1.json
  def destroy
    @university_event.destroy
    respond_to do |format|
      format.html { redirect_to university_events_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_university_event
      @university_event = UniversityEvent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def university_event_params
      params.require(:university_event).permit(:timetable_id, :course_module_id, :title, :room, :date, :start_at, :end_at, :repeat_type, :repeat_frequency, :colour, :privacy, :description,:day, :type, location_attributes: [:id, :address, :latitude, :longitude])
    end

    def find_timetable
      if params[:timetable_id]
        @timetable = Timetable.find(params[:timetable_id])
        @course_modules = @timetable.course.course_modules.collect{|m| [m.code + " | " + m.title, m.id]}
      end
    end
end
