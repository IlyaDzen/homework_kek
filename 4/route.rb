class Route
  attr_reader :stops, :stops_index, :start_station, :final_station

  def initialize(start_station, final_station)
    @start_station = start_station
    @final_station = final_station
    @stops = [@start_station, @final_station]
    @stops_index = 1
  end

  def add_stops(station)
    stops.insert(stops_index, station)
    @stops_index += 1
  end 

  def delete_stops
    stops.delete_at(stops_index)
    @stops_index -= 1
  end 
end