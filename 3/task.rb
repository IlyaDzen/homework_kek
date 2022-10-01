class Station
  def initialize(name)
      @name = name
      @trains = []
  end

  def train_arrive
  end
end

class Route
end

class Train
  def initialize(number, type, quantity)
    @number = number
    @type = type
    @quantity = quantity
    @speed = 0
  end

  def current_speed
    @speed
  end

  def set_speed
    @speed += 5
  end

  def stop
    @speed = 0
  end

  def quantity
    @quantity
  end

  def quantity_attach
    if @speed == 0
      @quantity += 1
      else @quantity = quantity
    end
  end

  def quantity_detach
    if @quantity > 0 and @speed == 0
      @quantity -= 1
      else @quantity = quantity
    end
  end
end

