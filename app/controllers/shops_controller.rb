class ShopsController < ApplicationController
  before_action :set_shop, only: [:show, :edit, :update, :destroy]
  before_action :set_mode

  # GET /shops
  # GET /shops.json
  def index
    @city = City.find(params[:city_id])
    @shops = @city.shops.paginate(page: params[:page], per_page: 10)

    add_breadcrumb "首页", :root_path
    add_breadcrumb @city.name, @city
    add_breadcrumb "美食列表"
  end

  # GET /shops/1
  # GET /shops/1.json
  def show
    @city = @shop.city

    add_breadcrumb "首页", :root_path
    add_breadcrumb @city.name, @city
    add_breadcrumb "美食列表", city_shops_path(@city)
    add_breadcrumb @shop.name
  end

  # GET /shops/new
  def new
    @shop = Shop.new
  end

  # GET /shops/1/edit
  def edit
  end

  # POST /shops
  # POST /shops.json
  def create
    @shop = Shop.new(shop_params)

    respond_to do |format|
      if @shop.save
        format.html { redirect_to @shop, notice: 'Shop was successfully created.' }
        format.json { render :show, status: :created, location: @shop }
      else
        format.html { render :new }
        format.json { render json: @shop.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shops/1
  # PATCH/PUT /shops/1.json
  def update
    respond_to do |format|
      if @shop.update(shop_params)
        format.html { redirect_to @shop, notice: 'Shop was successfully updated.' }
        format.json { render :show, status: :ok, location: @shop }
      else
        format.html { render :edit }
        format.json { render json: @shop.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shops/1
  # DELETE /shops/1.json
  def destroy
    @shop.destroy
    respond_to do |format|
      format.html { redirect_to shops_url, notice: 'Shop was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shop
      @shop = Shop.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shop_params
      params.require(:shop).permit(:name, :addr, :tel, :special, :work_range, :price_avg)
    end

    def set_mode
      # @mode = @shop.city.name
    end
end
