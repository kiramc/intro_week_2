# [1]

class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye 
    greet ("Goodbye")
  end
end

# 1. "Hello", 2. no method error, 3. missing argument error, 4. "Goodbye", 5. no class method error

# [2]

# [3]

class AngryCat
  def initialize(age, name)
    @age = age
    @name = name
  end

  def age
    puts @age
  end

  def name
    puts @name
  end

  def hiss
    puts "Hisssss!!!"
  end
end

sesame = AngryCat.new(10, "Sesame")
eveline = AngryCat.new(5, "Eveline")

puts sesame.age
puts eveline.name

# [4]

class Cat
  attr_reader :type

  def initialize(type)
    @type = type
  end

  def to_s
    puts "I am a #{type} cat."
  end
end

meow = Cat.new("tabby")
puts meow.to_s

# [5]

# self.manufacturer is a class method so you will get an error
# model is an instance method - will give you the model of the tv

# [6]

class CatCat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age = 0
  end

  def make_one_year_older
    self.age += 1
  end
end

# - instead of using self.age you could use @ instead

# [7]

class Light
  attr_accessor :brightness :color

  def initialize(brightness, color)
    @brightness = brightness
    @color = color
  end

  def self.information
    return "I want to turn on the light with a brightness level of super high and a colour of green."
  end
end

# return is unnecessary, also don't hard code the attributes

# BETTER:

class Light
  attr_accessor :brightness :color

  def initialize(brightness, color)
    @brightness = brightness
    @color = color
  end

  def self.information
    "I want to turn on the light with a brightness level of #{self.brightness} and a color of #{self.color}"
  end
end






















