class TimetablesController < ApplicationController

  layout :set_layout

  before_action :confirm_logged_in, :except => [:show,:index]
  before_action :set_timetable, only: [:show, :edit, :update, :destroy ]
  before_action :set_academic_years, only: [:new, :edit]

  # GET /timetables
  # GET /timetables.json
  def index

    if student_signed_in?
        @timetables = Timetable.where(:course => current_student.course).where(:level => current_student.level).where(:start_at => 10.months.ago..Date.today)
      else
        @timetables = Timetable.all
      end

  end

  # GET /timetables/1
  # GET /timetables/1.json
  def show
    @university_events = @timetable.university_events
  end

  # GET /timetables/new
  def new
    @timetable = Timetable.new
    @courses = Course.all.collect{|c| [c.title, c.id]}
  end

  # GET /timetables/1/edit
  def edit
    @courses = Course.all.collect{|c| [c.title, c.id]}
  end

  # POST /timetables
  # POST /timetables.json
  def create
    @timetable = Timetable.new(timetable_params)

    respond_to do |format|
      if @timetable.save
        format.html { redirect_to timetables_path, notice: 'Timetable was successfully created.' }
        format.json { render action: 'show', status: :created, location: @timetable }
      else
        format.html { render action: 'new' }
        format.json { render json: @timetable.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /timetables/1
  # PATCH/PUT /timetables/1.json
  def update
    respond_to do |format|
      if @timetable.update(timetable_params)
        format.html { redirect_to timetables_path, notice: 'Timetable was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @timetable.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /timetables/1
  # DELETE /timetables/1.json
  def destroy
    @timetable.destroy
    respond_to do |format|
      format.html { redirect_to timetables_url }
      format.json { head :no_content }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_timetable
      @timetable = Timetable.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def timetable_params
      params.require(:timetable).permit(:course_id,:level, :term, :start_at, :end_at, :academic_year)
    end

    #This method returs a list of the aveliable academic years
    def set_academic_years
        years = (Date.today.year-5..Date.today.year+5)
        @academic_years =  years.map { |year| year.to_s+'/'+(year+1).to_s }
    end

    def set_layout
      if student_signed_in?
        "test"
      else
        "webmaster_area"
      end
    end


    def confirm_logged_in
      unless session[:admin_id]
        flash[:notice] = "You need to log in"
        redirect_to(:controller => 'access', :action => 'login')
        return false
      else
        return true
      end
    end

end
