class CitiesController < ApplicationController
  before_action :set_city, only: [:show, :edit, :update, :destroy, :info]
  
  # GET /cities
  # GET /cities.json
  def index
    @cities = City.all
  end

  def info
    @weather = Weather.new(@city).sina_weather
    @mode = @city.name

    add_breadcrumb "首页", :root_path
    add_breadcrumb @city.name, @city
    add_breadcrumb "城市信息"
  end

  # GET /cities/1
  # GET /cities/1.json
  def show
    @info_images = @city.info_images.limit(4)
    @tours = @city.tours.limit(6)
    @hotels = @city.hotels.limit(4)
    @shops = @city.shops.limit(4)
    @mode = @city.name
  end

  # GET /cities/new
  def new
    @city = City.new
  end

  # GET /cities/1/edit
  def edit
  end

  # POST /cities
  # POST /cities.json
  def create
    @city = City.new(city_params)

    respond_to do |format|
      if @city.save
        format.html { redirect_to @city, notice: 'City was successfully created.' }
        format.json { render :show, status: :created, location: @city }
      else
        format.html { render :new }
        format.json { render json: @city.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cities/1
  # PATCH/PUT /cities/1.json
  def update
    respond_to do |format|
      if @city.update(city_params)
        format.html { redirect_to @city, notice: 'City was successfully updated.' }
        format.json { render :show, status: :ok, location: @city }
      else
        format.html { render :edit }
        format.json { render json: @city.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cities/1
  # DELETE /cities/1.json
  def destroy
    @city.destroy
    respond_to do |format|
      format.html { redirect_to cities_url, notice: 'City was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_city
      @city = City.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def city_params
      params[:city]
    end
end
