class Hand
  include Comparable

  attr_reader :value

  def initialize(v)
    @value = v
  end

  def <=> (another_hand)
    if @value == another_hand.value
      0
    elsif (@value == 'p' && another_hand.value == 'r') || 
      (@value == 's' && another_hand.value == 'p') ||
      (@value == 'r' && another_hand.value == 's')
      1
    else
      -1
    end
  end

  def display_winning_message
    case @value
    when "r"
      puts "Rock smashes scissors."
    when "p"
      puts "Paper covers rock."
    when "s"
      puts "Scissors shred paper."
    end
  end

end

class Human < Hand
  attr_accessor :hand
  attr_reader :name

  def initialize(name)
    puts "What's your name?"
    @name = gets.chomp
  end

  def to_s
    "#{name} chose #{self.hand.value}."
  end

  def pick_hand
    loop do
      puts "Choose one: Rock (r), Paper (p), or Scissors (s)."
      player_choice = gets.chomp.downcase
      if Game::CHOICES.keys.include?(player_choice)
        # puts "You chose #{Game::CHOICES[player_choice]}."
        puts self.to_s
        break
      else
        puts "That is not a valid selection!"
      end
    self.hand = Hand.new(player_choice)
    end
  end   

end

class Computer < Hand
  attr_accessor :hand
  attr_reader :name

  def initialize(name)
    @name = "Computer"
  end

  def to_s
    "Computer chose #{Game::CHOICES[self.hand.value]}."
  end

  def pick_hand
    self.hand = Hand.new(Game::CHOICES.keys.sample)
    puts self.to_s
  end
end

class Game
  CHOICES = {'r' => 'Rock', 'p' => 'Paper', 's' => 'Scissors'}

  attr_reader :player, :computer

  def initialize
    @player = Human.new("Kira")
    @computer = Computer.new("R2D2")
  end

  def compare_hands
    if player.hand == computer.hand
      puts "It's a tie!"
    elsif player.hand > computer.hand
      player.hand.display_winning_message
      puts "#{player.name} wins!"
    else
      computer.hand.display_winning_message
      puts "#{computer.name} wins!"
    end
  end

  def play
    player.pick_hand
    computer.pick_hand
    compare_hands
  end
end

game = Game.new.play