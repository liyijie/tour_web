class PomotionsController < ApplicationController
  before_action :set_pomotion, only: [:show, :edit, :update, :destroy]

  add_breadcrumb "首页", :root_path

  # GET /pomotions
  # GET /pomotions.json
  def index
    @pomotions = Pomotion.all
  end

  # GET /pomotions/1
  # GET /pomotions/1.json
  def show
    @category = @pomotion.category
    add_breadcrumb @category.name, @category
    add_breadcrumb @pomotion.title, [@category, @pomotion]
  end

  # GET /pomotions/new
  def new
    @pomotion = Pomotion.new
  end

  # GET /pomotions/1/edit
  def edit
  end

  # POST /pomotions
  # POST /pomotions.json
  def create
    @pomotion = Pomotion.new(pomotion_params)

    respond_to do |format|
      if @pomotion.save
        format.html { redirect_to @pomotion, notice: 'Pomotion was successfully created.' }
        format.json { render :show, status: :created, location: @pomotion }
      else
        format.html { render :new }
        format.json { render json: @pomotion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pomotions/1
  # PATCH/PUT /pomotions/1.json
  def update
    respond_to do |format|
      if @pomotion.update(pomotion_params)
        format.html { redirect_to @pomotion, notice: 'Pomotion was successfully updated.' }
        format.json { render :show, status: :ok, location: @pomotion }
      else
        format.html { render :edit }
        format.json { render json: @pomotion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pomotions/1
  # DELETE /pomotions/1.json
  def destroy
    @pomotion.destroy
    respond_to do |format|
      format.html { redirect_to pomotions_url, notice: 'Pomotion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pomotion
      @pomotion = Pomotion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pomotion_params
      params.require(:pomotion).permit(:title, :sub_title, :content, :rate, :category_id)
    end
end
