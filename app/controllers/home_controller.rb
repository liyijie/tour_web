class HomeController < ApplicationController
  def index
    @categories = Category.all
    @cities = City.all
    @tours = Tour.limit(7)
    @hotels = Hotel.limit(6)
  end
end
