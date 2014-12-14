class TourOrdersController < InheritedResources::Base

  private

    def tour_order_params
      params.require(:tour_order).permit(:total_price, :state, :number, :user_id, :ticket_id, :token)
    end
end

