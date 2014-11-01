class WebmastersController < ApplicationController
  
  before_action :set_webmaster, only: [:show, :edit, :update, :destroy]

  # GET /webmasters
  # GET /webmasters.json
  def index
    @webmasters = Webmaster.all
  end

  # GET /webmasters/1
  # GET /webmasters/1.json
  def show
  end

  # GET /webmasters/new
  def new
    @webmaster = Webmaster.new
  end

  # GET /webmasters/1/edit
  def edit
  end

  # POST /webmasters
  # POST /webmasters.json
  def create
    @webmaster = Webmaster.new(webmaster_params)

    respond_to do |format|
      if @webmaster.save
        format.html { redirect_to @webmaster, notice: 'Webmaster was successfully created.' }
        format.json { render action: 'show', status: :created, location: @webmaster }
      else
        format.html { render action: 'new' }
        format.json { render json: @webmaster.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /webmasters/1
  # PATCH/PUT /webmasters/1.json
  def update
    respond_to do |format|
      if @webmaster.update(webmaster_params)
        format.html { redirect_to @webmaster, notice: 'Webmaster was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @webmaster.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /webmasters/1
  # DELETE /webmasters/1.json
  def destroy
    @webmaster.destroy
    respond_to do |format|
      format.html { redirect_to webmasters_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_webmaster
      @webmaster = Webmaster.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def webmaster_params
      params.require(:webmaster).permit(:username, :password, :first_name, :last_name)
    end
end
