require_relative 'module'

class Wagon
  include Company
  attr_reader :type

  def initialize(type)
    @type = type
  end
end

class PassengerWagons < Wagon
  attr_reader :seats, :taken_seats

  def initialize(seats)
    @seats = seats
    @taken_seats = 0
  end

  def take_seat
    @taken_seats += 1
  end

  def view_taken_seats
    @taken_seats
  end

  def view_free_seats
    @seats - @taken_seats
  end
end


class CargoWagons < Wagon
  attr_reader :volume, :occuped_volume

  def initialize(volume)
    @volume = volume
    @occuped_volume = 0
  end

  def occupy
    puts "How much volume u want to feel? "
    @occuped_volume = gets.to_i
  end

  def view_occuped_volume
    @occuped_volume
  end

  def view_free_volume
    @volume - @occuped_volume
  end
end