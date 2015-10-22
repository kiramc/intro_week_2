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



































