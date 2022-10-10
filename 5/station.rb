class Station
  attr_reader :trains, :gruz_quantity, :pass_quantity, :name
  include InstanceCounter
  
  @@stations = []
  def initialize(name)
    @@stations << self
    @name = name
    @trains = []
    @gruz_quantity = 0
    @pass_quantity = 0
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