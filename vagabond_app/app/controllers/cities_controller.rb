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


    redirect_to city_path(@city)

  end

  def destroy
    city_id = params[:id]
    @city = City.find_by_id(city_id)
    @city.delete
    redirect_to cities_path
  end

  private
  def city_params
    params.require(:city).permit(:name, :image)
  end
end
