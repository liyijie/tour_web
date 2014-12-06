class HomeController < ApplicationController
  def index
    @categories = Category.all
    @cities = City.all
  end
end
