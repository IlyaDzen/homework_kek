require_relative 'module'

class Wagon
  include Company
  attr_reader :type

  def initialize(type)
    @type = type
  end
end

class PassengerWagons < Wagon
  attr_reader :seats, :free_seats

  def initialize(seats)
    @seats = seats
    @free_seats = []
  end
end


class CargoWagons < Wagon
  attr_reader :volume

  def initialize(volume)
    @volume = volume
  end
end