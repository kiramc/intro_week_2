class GoodDog
  @@number_of_dogs = 0

  def initialize
    @@number_of_dogs += 1
  end

  def self.total_number_of_dogs
    @@number_of_dogs
  end

  def self.what_am_i
    "I'm a GoodDog class!"
  end
end

p GoodDog.what_am_i

puts GoodDog.total_number_of_dogs

dog1 = GoodDog.new
dog2 = GoodDog.new

puts GoodDog.total_number_of_dogs

class BetterDog
  DOG_YEARS = 7

  attr_accessor :name, :age

  def initialize(name, age)
    self.name = name
    self.age = age * DOG_YEARS
  end

  def to_s
    "This dog's name is #{name} and it is #{age} in dog years."
  end
end

sparky = BetterDog.new("Sparky", 4)
puts sparky.age

puts sparky
p sparky

class ThirdDog
  attr_accessor :name, :height, :weight

  def initialize(name, height, weight)
    self.name = name
    self.height = height
    self.weight = weight
  end

  def change_info(name, height, weigth)
    self.name = name
    self.height = height
    self.weight = weight
  end

  def info
    "#{self.name} weights #{self.weight} and is #{self.height} tall."
  end

  def what_is_self
    self
  end
end

sparky = ThirdDog.new("Sparky", "12 inches", "10 lbs")
p sparky.what_is_self











