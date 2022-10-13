require_relative 'train'
require_relative 'route'
require_relative 'station'
require_relative 'wagons'

@trains = []
@routes = []
@stations = []

  #    - Создавать станции
  #    - Создавать поезда
  #    - Создавать маршруты и управлять станциями в нем (добавлять, удалять)
  #    - Назначать маршрут поезду
  #    - Добавлять вагоны к поезду
  #    - Отцеплять вагоны от поезда
  #    - Перемещать поезд по маршруту вперед и назад
  #    - Просматривать список станций и список поездов на станции

def create_station
  puts "Enter station name: "
  name = gets.chomp
  @stations << Station.new(name)
end

def create_train
  puts "Enter train number: "
  train_number = gets.chomp
  puts "Enter type pass/cargo: "
  train_type = gets.chomp
  if train_type == 'pass'
    @trains << PassengerTrain.new(train_number)
    puts "You have created passenger train #{train_number}"
  elsif train_type == 'cargo'
    @trains << CargoTrain.new(train_number)
    puts "You have created cargo train #{train_number}"
  else
    raise
  end
rescue
  puts 'Put valid format please'
end

def create_route
  puts "Available stations: "
  @stations.each.with_index do |station, index| 
    puts "#{index}. #{station.name}"
  end
  puts "Create route, select start station index: "
  start_station_index = gets.to_i
  start_station = @stations[start_station_index]
  puts "Create route, select final station index: "
  final_station_index = gets.to_i
  final_station = @stations[final_station_index]
  @routes << Route.new(start_station, final_station)
end

def create_stops
  puts "Available routes: "
  @routes.each.with_index do |route, index|
    puts "#{index}. #{route.start_station.name}-#{route.final_station.name}"
  end
  

  puts "Select route index: "
  route_index = gets.to_i
  route = @routes[route_index]

  puts "Available stations: "
  @stations.each.with_index do |station, index| 
    puts "#{index}. #{station.name}"
  end

  puts "Add station, select station index: "
  station_index = gets.to_i
  station = @stations[station_index]

  route.add_stops(station)

  puts "Current stops are: #{route.stops.map { |route| route.name }.join(" - ")}"
end

def delete_stops
  puts "Select route, "
  puts "Available routes: "
  @routes.each.with_index do |route, index|
    puts "#{index}. #{route.start_station.name}-#{route.final_station.name}"
  end
  puts "Select route index: "
  route_index = gets.to_i
  route = @routes[route_index]

  route.delete_stops
end

def set_train_route
  puts "Available trains: "
  @trains.each.with_index do |train, index| 
    puts "#{index}. #{train.number}"
  end
  puts "Select train: "
  train_index = gets.to_i
  train = @trains[train_index]

  puts "Available routes: "
  @routes.each.with_index do |route, index|
    puts "#{index}. #{route.start_station.name}-#{route.final_station.name}"
  end

  puts "Select route index: "
  route_index = gets.to_i
  route = @routes[route_index]

  train.set_route(route)
end

def attach_wagon
  puts "Available trains: "
  @trains.each.with_index do |train, index| 
    puts "#{index}. #{train.number}"
  end
  puts "Select train: "
  train_index = gets.to_i
  train = @trains[train_index]

  if train.is_a?(PassengerTrain)
    passenger_wagon = Wagon.new('pass')
    train.quantity_attach(passenger_wagon)
  elsif train.is_a?(CargoTrain) 
    cargo_wagon = Wagon.new('cargo')
    train.quantity_attach(cargo_wagon)
  end
end

def detach_wagon
  puts "Available trains: "
  @trains.each.with_index do |train, index| 
    puts "#{index}. #{train.number}"
  end
  puts "Select train: "
  train_index = gets.to_i
  train = @trains[train_index]

  train.quantity_detach
end

def move_forward
  puts "Available trains: "
  @trains.each.with_index do |train, index| 
    puts "#{index}. #{train.number}"
  end
  puts "Select train: "
  train_index = gets.to_i
  train = @trains[train_index]

  train.move_forward
end

def move_backward
  puts "Available trains: "
  @trains.each.with_index do |train, index| 
    puts "#{index}. #{train.number}"
  end
  puts "Select train: "
  train_index = gets.to_i
  train = @trains[train_index]

  train.move_backward
end

def stations
  puts "Available stations: "
  @stations.each.with_index do |station, index| 
    puts "#{index}. #{station.name}"
  end
end

def trains_on_station
  puts "Available stations: "
  @stations.each.with_index do |station, index| 
    puts "#{index}. #{station.name}"
  end
  puts "select station index: "
  station_index = gets.to_i
  station = @stations[station_index]

  puts station.trains.map { |train| train.number }.join(", ")
end

loop do
  puts "Enter 1 to create station"
  puts "Enter 2 to create train"
  puts "Enter 3 to create route"
  puts "Enter 4 to add stops"
  puts "Enter 5 to delete stops"
  puts "Enter 6 to set train route"
  puts "Enter 7 to attach_wagon"
  puts "Enter 8 to detach_wagon"
  puts "Enter 9 to move_forward"
  puts "Enter 10 to move_backward"
  puts "Enter 11 to view stations"
  puts "Enter 12 to view trains on station"
  puts "0 to exit" 
  enter_index = gets.to_i
  case enter_index
  when 1 
    create_station
  when 2
    create_train
  when 3
    create_route
  when 4
    create_stops
  when 5
    delete_stops
  when 6
    set_train_route
  when 7
    attach_wagon
  when 8
    detach_wagon
  when 9
    move_forward
  when 10
    move_backward
  when 11
    stations
  when 12
    trains_on_station
  when 0
    break
  end
end