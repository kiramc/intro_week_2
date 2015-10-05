module Towable
  def can_tow?(pounds)
    pounds < 2000 ? true : false
  end
end

class Vehicle

  @@number_of_vehicles = 0

  def self.number_of_vehicles
    puts "This program has created #{@@number_of_vehicles} vehicles."
  end

  def initialize 
    @@number_of_vehicles += 1
  end
  
  def self.gas_mileage(amount, distance)
    puts "Mileage is: #{distance/amount}"
  end

  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
    @current_speed = 0
  end

  def speed_up(number)
    @current_speed += number
    puts "Accelerating #{number} km/hr..."
  end

  def brake(number)
    @current_speed -= number
    puts "Decelerating at #{number} km/hr..."
  end

  def current_speed
    puts "You are now going #{@current_speed} km/hr."
  end

  def shut_off
    @current_speed = 0
    puts "Parking."
  end

  def spray_paint(choice)
    self.color = choice
  end

  def age
    "Your #{self.model} is #{years_old} years old."
  end

  private

  def calculate_age
    Time.now.year - self.year
  end

end

class MyCar < Vehicle
  attr_accessor :color
  attr_reader :year

  def to_s
     "This car is a #{year} #{color} #{@model}."
  end
end

class MyTruck < Vehicle
  include Towable

  DOORS = 2
end


camry = MyCar.new(2007, "grey", "Toyota Camry")
camry.speed_up(20)
camry.current_speed
camry.brake(15)
camry.current_speed
camry.shut_off
camry.current_speed

camry.color = "grey"
puts camry.color
puts camry.year

puts camry.color
camry.spray_paint("black")
puts camry.color

MyCar.gas_mileage(500, 15)

puts camry.age

puts Vehicle.number_of_vehicles

puts MyCar.ancestors
puts MyTruck.ancestors
puts Vehicle.ancestors



