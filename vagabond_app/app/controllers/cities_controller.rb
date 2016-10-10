class CitiesController < ApplicationController
  def index
    @cities = City.all
  end

  def new
    @city = City.new
  end


  def show
    @city = City.find_by_id(params[:id])
  end

  def create
    @city = City.create(city_params)

    current_user.city << @city
    City.find_by_id(1).posts << @post

    redirect_to city_path(1,@post)

  end

  private
  def city_params
    params.require(:city).permit(:name, :image)
  end
end
