class ToursController < ApplicationController
  before_action :set_tour, only: [:show, :edit, :update, :destroy]

  # GET /tours
  # GET /tours.json
  def index
    @city = City.find(params[:city_id])
    @tours = @city.tours.paginate(page: params[:page], per_page: 10)
    @relate_hotels = Hotel.relates @tours[0] if @tours[0]
    @mode = @city.name

    add_breadcrumb "首页", :root_path
    add_breadcrumb @city.name, @city
    add_breadcrumb "景点列表"
  end

  # GET /tours/1
  # GET /tours/1.json
  def show
    @city = @tour.city
    @relate_hotels = Hotel.relates @tour
    @mode = @city.name

    add_breadcrumb "首页", :root_path
    add_breadcrumb @city.name, @city
    add_breadcrumb "景点列表", city_tours_path(@city)
    add_breadcrumb @tour.title
  end

  # GET /tours/new
  def new
    @tour = Tour.new
  end

  # GET /tours/1/edit
  def edit
  end

  # POST /tours
  # POST /tours.json
  def create
    @tour = Tour.new(tour_params)

    respond_to do |format|
      if @tour.save
        format.html { redirect_to @tour, notice: 'Tour was successfully created.' }
        format.json { render :show, status: :created, location: @tour }
      else
        format.html { render :new }
        format.json { render json: @tour.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tours/1
  # PATCH/PUT /tours/1.json
  def update
    respond_to do |format|
      if @tour.update(tour_params)
        format.html { redirect_to @tour, notice: 'Tour was successfully updated.' }
        format.json { render :show, status: :ok, location: @tour }
      else
        format.html { render :edit }
        format.json { render json: @tour.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tours/1
  # DELETE /tours/1.json
  def destroy
    @tour.destroy
    respond_to do |format|
      format.html { redirect_to tours_url, notice: 'Tour was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tour
      @tour = Tour.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tour_params
      params.require(:tour).permit(:title, :sub_title, :addr, :price, :work_range, :hint, :desc, 
        :traffic, :seq, :position, :lon, :lat, :city_id,
        tickets_attributes: [:id, :title, :style, :desc, :price, :_destroy],
        images_attributes: [:id, :photo, :_destroy],
        )
    end
end
