class SitesController < ApplicationController
  before_action :set_site, only: [:show, :edit, :update, :destroy]

  # GET /sites
  # GET /sites.json
  def index
    if current_user.present?
      @sites = current_user.sites
      @site = Site.new
      @webstats = Webstat.includes(:site).order(:pull_date)
      respond_to do |format|
        format.html
        format.csv { send_data @webstats.to_csv }
      end
    else
      redirect_to signup_path
       flash[:danger] = 'You must be logged in to see that page!'
    end
  end


  # GET /sites/1
  # GET /sites/1.json
  def show
    @mobile = Pagespeed.new(@site, true)
    @desktop = Pagespeed.new(@site)
    @sites = Site.all
  end

  # GET /sites/new
  def new
    @site = Site.new
  end

  # GET /sites/1/edit
  def edit
  end

  # POST /sites
  # POST /sites.json
  def create
    @site = Site.new(site_params)
    @site.user_id = current_user.id

    respond_to do |format|
      if @site.save
        format.html { redirect_to @site, notice: "#{@site.name} was successfully added." }
        format.json { render :show, status: :created, location: @site }
      else
        format.html { render :new }
        format.json { render json: @site.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sites/1
  # PATCH/PUT /sites/1.json
  def update
    respond_to do |format|
      if @site.update(site_params)
        format.html { redirect_to @site, notice: "#{@site.name} was successfully updated." }
        format.json { render :show, status: :ok, location: @site }
      else
        format.html { render :edit }
        format.json { render json: @site.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sites/1
  # DELETE /sites/1.json
  def destroy
    @site.destroy
    respond_to do |format|
      format.html { redirect_to sites_url, notice: "#{@site.name} was successfully deleted." }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_site
    @site = Site.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def site_params
    params.require(:site).permit(:url, :name)
  end

end
