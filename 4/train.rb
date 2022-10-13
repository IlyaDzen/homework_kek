class Train
  attr_reader :speed, :quantity , :route_index, :route, :wagon_index, :wagons, :number

  def initialize(number)
    @number = number
    @speed = 0
    @wagon_index = 1
    @wagons = []
  end

  def increase_speed
    @speed += 5
  end

  def stop
    @speed = 0
  end

  def quantity_detach
    @wagons.delete(wagons.last)
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

class PassengerTrain < Train
  def quantity_attach(wagon)
    if wagon.type = 'pass'
      @wagons.push(wagon)
    end
  end
end

class CargoTrain < Train
  def quantity_attach(wagon)
    if wagon.type = 'cargo'
      @wagons.push(wagon)
    end
  end
end
