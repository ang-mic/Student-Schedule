class CourseModulesController < ApplicationController


  layout 'webmaster_area'

  before_action :confirm_logged_in
  before_action :set_course_module, only: [:show, :edit, :update, :destroy, :calendar]

  # GET /course_modules
  # GET /course_modules.json
  def index
    # @course_modules = CourseModule.all
    @course_modules = CourseModule.order(:course_id)
  end

  # GET /course_modules/1
  # GET /course_modules/1.json
  def show
  end

  # GET /course_modules/new
  def new
    @course_module = CourseModule.new
    @courses = Course.all.collect{|c| [c.title, c.id]}
  end

  # GET /course_modules/1/edit
  def edit
    @courses = Course.all.collect{|c| [c.title, c.id]}
  end

  # POST /course_modules
  # POST /course_modules.json
  def create
    @course_module = CourseModule.new(course_module_params)

    respond_to do |format|
      if @course_module.save
        format.html { redirect_to @course_module, notice: 'Course module was successfully created.' }
        format.json { render action: 'show', status: :created, location: @course_module }
      else
        format.html { render action: 'new' }
        format.json { render json: @course_module.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /course_modules/1
  # PATCH/PUT /course_modules/1.json
  def update
    respond_to do |format|
      if @course_module.update(course_module_params)
        format.html { redirect_to @course_module, notice: 'Course module was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @course_module.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /course_modules/1
  # DELETE /course_modules/1.json
  def destroy
    @course_module.destroy
    respond_to do |format|
      format.html { redirect_to course_modules_url }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course_module
      @course_module = CourseModule.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_module_params
      params.require(:course_module).permit(:course_id, :title, :code, :level, :lecturer)
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
