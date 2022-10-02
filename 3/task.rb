class Station
  attr_reader :trains, :gruz_quantity, :pass_quantity

  def initialize(name)
    @name = name
    @trains = []
    @gruz_quantity = 0
    @pass_quantity = 0
  end

  def train_arrive(train)
    trains.push(train)
    if train.type == 'pass'
      @pass_quantity += 1
    else
      @gruz_quantity += 1
    end
  end

  def train_departure(train)
    trains.delete(trains)
    if train.type == 'pass'
      @pass_quantity -= 1
    else
      @gruz_quantity -= 1
    end
  end
end

class Route
  attr_reader :stops, :stops_index

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

class Train
  attr_reader :speed, :quantity , :route_index, :route

  def initialize(number, type, quantity)
    @number = number
    @type = type
    @quantity = quantity
    @speed = 0
    @station
  end

  def type
    @type
  end

  def increase_speed
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
    current_station.train_arrive(self)
  end

  def current_station
    route.stops[route_index]
  end

  def move_forward
    current_station.train_departure(self)
    @route_index += 1
    current_station.train_arrive(self)
  end

  def move_backward
    current_station.train_departure(self)
    @route_index -= 1
    current_station.train_arrive(self)
   end

  def previos
    route.stops[route_index - 1]
  end

  def next
    route.stops[route_index + 1]
  end
end

