require_relative 'module'

class Station
  attr_reader :trains, :gruz_quantity, :pass_quantity, :name
  include InstanceCounter
  
  NAME_FORMAT = /.+/

  @@stations = []
  def initialize(name)
    @@stations << self
    @name = name
    @trains = []
    @gruz_quantity = 0
    @pass_quantity = 0
    station_validate!
  end

  def station_valid?
    station_validate!
  rescue
    false
  end

  def station_validate!
    raise "Name has invalid format" if name !~ NAME_FORMAT
    true
  end


  def train_arrive(train)
    trains.push(train)
    if train.is_a?(PassengerTrain)
      @pass_quantity += 1
    else
      @gruz_quantity += 1
    end
  end

  def train_departure(train)
    trains.delete(trains)
    if train.is_a?(PassengerTrain)
      @pass_quantity -= 1
    else
      @gruz_quantity -= 1
    end
  end

  def all
    @@stations.inspect
  end
end