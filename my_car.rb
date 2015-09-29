class MyCar
  attr_accessor :color
  attr_reader :year

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
camry.spray_paint("black)
puts camry.color

