class HotelsController < InheritedResources::Base

  private

    def hotel_params
      params.require(:hotel).permit(:name, :addr, :tel, :desc, :traffic, :city_id)
    end
end

