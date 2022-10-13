class Car
  attr_accessor :number
  def initialize(number)
    @number = number
  end
end

def find(array, number)

end


car1, car2, car3 = [Car.new(123), Car.new(555), Car.new(4573244)]
array = [car1, car2, car3]
find(array, 123) == car1
find(array, 4573244) == car3
find(array, 555) == car2
find(array, 2398547290) == nil