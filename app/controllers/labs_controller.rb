class LabsController < ApplicationController
  before_action :set_lab, only: [:show, :edit, :update, :destroy]

  # GET /labs
  # GET /labs.json
  def index
    @labs = Lab.all
  end

  # GET /labs/1
  # GET /labs/1.json
  def show
  end

  # GET /labs/new
  # def new
  #   @lab = Lab.new
  #   @course_modules = CourseModule.all.collect{|m| [m.code + " | " + m.title, m.id]}
  #   @lab.build_location
  # end

  # GET /labs/1/edit
  def edit
    @course_modules = CourseModule.all.collect{|m| [m.code + " | " + m.title, m.id]}
    @lab.build_location
  end

  # POST /labs
  # POST /labs.json
  # def create
  #   @lab = Lab.new(lab_params)

  #   respond_to do |format|
  #     if @lab.save
  #       format.html { redirect_to @lab, notice: 'Lab was successfully created.' }
  #       format.json { render action: 'show', status: :created, location: @lab }
  #     else
  #       format.html { render action: 'new' }
  #       format.json { render json: @lab.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # PATCH/PUT /labs/1
  # PATCH/PUT /labs/1.json
  def update
    respond_to do |format|
      if @lab.update(lab_params)
        format.html { redirect_to @lab, notice: 'Lab was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @lab.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /labs/1
  # DELETE /labs/1.json
  def destroy
    @lab.destroy
    respond_to do |format|
      format.html { redirect_to labs_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lab
      @lab = Lab.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lab_params
      params.require(:lab).permit( :course_module_id, :group, :title, :room,:date, :start_at, :end_at, :repeat_type, :repeat_frequency, :colour, :privacy, :description,:day, location_attributes: [:id, :address, :latitude, :longitude])
    end
end
