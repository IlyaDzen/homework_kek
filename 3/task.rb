class Station
  attr_reader :trains

  def initialize(name)
    @name = name
    @trains = []
    @gruz_quantity = 0
    @pass_quantuty = 0
  end

  def train_arrive(train)
    trains.push(train)
  end

  def train_departure
    trains.delete(trains.first)
  end
end

class Route
  attr_reader :stops

  def initialize(start_station, final_station)
    @start_station = start_station
    @final_station = final_station
    @stops = [@start_station, @final_station]
  end

  def add_stops(station)
    stops.delete(stops.last)
    stops.push(station)
    stops.push(@final_station)
  end 

  def delete_stops
    stops.delete(stops.last)
    stops.delete(stops.last)
    stops.push(@final_station)
  end 
end

class Train
  attr_reader :speed, :quantity , :route_index, :route

  def initialize(number, type, quantity)
    @number = number
    @type = type
    @quantity = quantity
    @speed = 0
    @station
  end

  def set_speed
    @speed += 5
  end

  def stop
    @speed = 0
  end

  def quantity_attach
    if @speed == 0
      @quantity += 1
    else 
      @quantity
    end
  end

  def quantity_detach
    if @quantity >= 0 and @speed == 0
      @quantity -= 1
    else 
      @quantity
    end
  end

  def set_route(route)
    @route = route
    @route_index = 0
  end

  def current_station
    route.stops[route_index]
  end

  def move_forward
    @route_index += 1
  end

  def move_backward
     @route_index -= 1
   end

   def previos
    route.stops[route_index - 1]
   end

     def next
    route.stops[route_index + 1]
   end
end

