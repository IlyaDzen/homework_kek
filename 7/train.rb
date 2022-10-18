require_relative 'module'

class Train
  include Company
  include InstanceCounter
  attr_reader :speed, :quantity , :route_index, :route, :wagon_index, :wagons, :number

  NUMBER_FORMAT = /^[a-z0-9]{3}-?[a-z0-9]{2}$/i

  def initialize(number)
    self.class.push_instances(self)
    @number = number
    @speed = 0
    @wagon_index = 1
    @wagons = []
    train_validate!
  end

  def train_valid?
    number =~ NUMBER_FORMAT
  end

  def train_validate!
    raise "Number has invalid format" if number !~ NUMBER_FORMAT
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

  def self.find(number)  

   self.all_instances.find { |train| train.number == number } 

  end

  def wagon_in_block(&block)
    wagons.each { |wagon| yield(wagon) }    
  end
end

class PassengerTrain < Train
  def quantity_attach(wagon)
      @wagons.push(wagon)
  end
end

class CargoTrain < Train
  def quantity_attach(wagon)
      @wagons.push(wagon)
  end
end
