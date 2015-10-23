# [1]

class SecretFile
  def initialize(secret_data, security_logger)
    @data = secret_data
    @security_logger = security_logger
  end

  def data
    @security_logger.create_log_entry
    @data
  end
end

class SecurityLogger
  def create_log_entry
    #... implementation...
  end
end


#[2]

module Driveable
  attr_accessor :speed, :heading
  attr_writer :fuel_efficiency, :fuel_capacity

  def initialize(km_traveled_per_litre, litres_of_fuel_capacity)
    self.fuel_efficiency = km_traveled_per_litre
    self.fuel_capacity = litres_of_fuel_capacity
  end

  def range
    @fuel_capacity * @fuel_efficiency
  end
end

module Wheelable
  def initialize(tire_array)
    @tires = tire_array
  end

  def tire_pressure(tire_index)
    @tires[tire_index]
  end

  def inflate_tire(tire_index, pressure)
    @tires[tire_index] = pressure
  end
end

class Auto
  include Driveable
  include Wheelable

  def initialize
    super([30,30,32,32], 50, 25.0)
  end
end

class Motorcycle < WheeledVehicle
  include Driveable
  include Wheelable
  
  def initialize
    super([20,20], 80, 8.0)
  end
end

class Catamaran
  include Driveable

  attr_accessor :propeller_count, :hull_count, :speed, :heading, :range

  def initialize(num_propellers, num_hulls, km_traveled_per_litre, litres_of_fuel_capacity)
    # code code code
  end
end

class Motorboat
  include Driveable

  attr_accessor :propeller_count, :hull_count, :speed, :heading

  def initialize(num_propellers, num_hulls)
    #code code
  end
end
