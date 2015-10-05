class Vehicle
  def initialize
    @make = make
    @year = year
    @color = color
    @current_speed = 0
  end

  def self.gas_mileage(gallons, miles)
    puts "Mileage: #{miles/gallons}."
  end
end

class MyCar < Vehicle
  DOORS = 4
end

class MyTruck < Vehicle
  DOORS = 2
end

camry = MyCar.new
puts camry

