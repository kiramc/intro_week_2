# [1]

class BankAccount
  attr_reader :balance

  def initialize(starting_balance)
    @balance = starting_balance
  end

  def positive_balance?
    balance >= 0
  end
end

# Ben is right, no @ is necessary because he uses an attribute reader ot access the variable. Ruby automatically creates a method called "balance" that returns the value of the @balance instance variable.

# [2]

class InvoiceEntry
  attr_reader :quantity, :product_name

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    # prevent negative quantities from being set
    quantity = updated_count if updated_count >= 0
  end
end

# attr_reader cannot change the value of the variables it accesses, only read them. It needs to be changed to attr_accessor to create both a getter and a setter method. Fixed code:

class InvoiceEntry
  attr_accessor :quantity, :product_name

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantiy(updated_count)
    self.quantity = updated_count if updated_count >= 0
  end
end

# OR just change quantity within the update_quantity method to @quantity to access the instace variable directly

# [3]

class InvoiceEntry
  attr_reader :quantity, :product_name

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    quantity = updated_count if updated_count >= 0
  end
end

# you also need to add self. in front of quantity to access the varible


# [4]

class Greeting
  def print_string(string)
    puts string
  end
end

class Hello < Greeting
  def hi
    print_string("Hello!")
  end
end

class Goodbye < Greeting
  def bye
    print_string("Goodbye!")
  end
end

# [5]

class KrispyKreme
  attr_reader :filling_type, :glazing

  def initialize(filling_type, glazing)
    @filling_type = filling_type
    @glazing = glazing
  end

  def to_s
    filling_string = filling_type ? filling_type : "Plain"
    glazing_string = glazing ? " with #{glazing}" : ""
    filling_string + glazing_string
  end        
end

donut1 = KrispyKreme.new(nil, nil)
donut2 = KrispyKreme.new("Vanilla", nil)
donut3 = KrispyKreme.new(nil, "sugar")
donut4 = KrispyKreme.new(nil, "chocolate sprinkles")
donut5 = KrispyKreme.new("Custard", "icing")

puts donut1
puts donut2
puts donut3
puts donut4
puts donut5

# [6]

class Computer
  attr_accessor :template

  def create_template
    @template = "template 14321"
  end

  def show_template
    template
  end
end

class Computer
  attr_accessor :template

  def create_template
    self.template = "template 14321"
  end

  def show_template
    self.template
  end
end

#no difference, and self. is not required

# [7]

class Light
  attr_accessor :brightness, :color

  def initialize(brightness, color)
    @brightness = brightness
    @color = color
  end

  def self.light_information
    "I want to turn on the light wiht a brightness level of super high and a color of green"
  end
end

# reference variables, don't hard code values. Also don't need self. so:

class Light
  attr_accessor :brightness, :color

  def initialize(brightness, color)
    @brightness = brightness
    @color = color
  end

  def information
    "I want to turn on the light wiht a brightness level of #{brightness} and a color of #{color}"
  end
end


































































