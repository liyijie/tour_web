class HomeController < ApplicationController
  def index
    @categories = Category.all
    @cities = City.all
    @tours = Tour.limit(7)
  end
end
