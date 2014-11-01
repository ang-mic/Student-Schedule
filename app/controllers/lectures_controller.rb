class LecturesController < ApplicationController
  before_action :set_lecture, only: [:show, :edit, :update, :destroy]

  # GET /lectures
  # GET /lectures.json
  def index
    @lectures = Lecture.all
  end

  # GET /lectures/1
  # GET /lectures/1.json
  def show
  end

  # GET /lectures/new
  # def new
  #   @lecture = Lecture.new
  #   @course_modules = CourseModule.all.collect{|m| [m.code + " | " + m.title, m.id]}
  #   @lecture.build_location
  # end

  # GET /lectures/1/edit
  def edit
    @course_modules = CourseModule.all.collect{|m| [m.code + " | " + m.title, m.id]}
    @lecture.build_location
  end

  # POST /lectures
  # POST /lectures.json
  # def create
  #   @lecture = Lecture.new(lecture_params)

  #   respond_to do |format|
  #     if @lecture.save
  #       format.html { redirect_to @lecture, notice: 'Lecture was successfully created.' }
  #       format.json { render action: 'show', status: :created, location: @lecture }
  #     else
  #       format.html { render action: 'new' }
  #       format.json { render json: @lecture.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # PATCH/PUT /lectures/1
  # PATCH/PUT /lectures/1.json
  def update
    respond_to do |format|
      if @lecture.update(lecture_params)
        format.html { redirect_to timetables_path, notice: 'Lecture was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @lecture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lectures/1
  # DELETE /lectures/1.json
  def destroy
    @lecture.destroy
    respond_to do |format|
      format.html { redirect_to timetables_path }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lecture
      @lecture = Lecture.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lecture_params
      params.require(:lecture).permit(:course_module_id , :title, :room, :date, :start_at, :end_at, :repeat_type, :repeat_frequency, :colour, :privacy, :description,:day, location_attributes: [:id, :address, :latitude, :longitude])
    end

    def find_timetable
      if params[:timetable_id]
        @timetable = Timetable.find(params[:timetable_id])
        @course_modules = @timetable.course.course_modules.collect{|m| [m.code + " | " + m.title, m.id]}
      end
    end
end
