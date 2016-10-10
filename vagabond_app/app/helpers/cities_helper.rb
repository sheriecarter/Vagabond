module CitiesHelper
  def current_city
    @current_city ||= City.find_by_id[:city_id]
  end
end
