class CoursesController < ApplicationController

  layout 'webmaster_area'
  before_action :confirm_logged_in
  before_action :set_course, only: [:show, :edit, :update, :destroy, :timetables]
  before_action :find_department

  # GET /courses
  # GET /courses.json
  def index
    if @department
      #If there is a selected department
      @courses = @department.courses
    else
      #This template is rendered only if the is no selected department.
      @departments = Department.all
      render('select_department')
    end
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
  end

  # GET /courses/new
  def new
    @course = Course.new
    @course.course_modules.build
    # @course_modules = CourseModule.all.collect{|m| [m.code + " | " + m.title, m.id]}
    # @departments = Department.all.collect{|d| [d.name, d.id]}
  end

  # GET /courses/1/edit
  def edit
     @course.course_modules.build
    # @course_modules = CourseModule.all.collect{|m| [m.code + " | " + m.title, m.id]}
    # @departments = Department.all.collect{|d| [d.name, d.id]}
  end

  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new(course_params)
    @course.department_id = @department.id

    respond_to do |format|
      if @course.save
        format.html { redirect_to department_course_path(@department,@course), notice: 'Course was successfully created.' }
        # format.json { render action: 'show', status: :created, location: @course }
      else
        format.html { render action: 'new' }
        # format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to department_course_path(@department,@course), notice: 'Course was successfully updated.' }
        # format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        # format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course.destroy
    respond_to do |format|
      format.html { redirect_to department_courses_path(@department) }
      # format.json { head :no_content }
    end
  end

  def timetables
    @timetables = @course.timetables
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.require(:course).permit(:department_id, :title, :short_title, :code, :number_of_levels, :category, course_modules_attributes: [:id, :title, :code, :level, :lecturer ,:_destroy])
    end

    def find_department
      if params[:department_id]
        @department = Department.find(params[:department_id])
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
