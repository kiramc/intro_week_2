require 'pry'

class Game
  def initialize
    @cards = Deck.new
    @player = Player.new
    @dealer = Dealer.new
  end

  def play
    @player.deal(@cards)
    puts @player.hand
  end

end

class Card
  def initialize(suit, value)
    @suit = suit
    @value = value
  end
end

class Deck
  attr_accessor :deck

  def initialize
    @deck = []
    %w(♣ ♥ ♠ ♦).each do |suit|
      %w(2 3 4 5 6 7 8 9 10 J K Q A).each do |value|
        @deck << Card.new(suit, value)
      end
    end
    deck.shuffle!
  end

  def deal_one
    deck.pop
  end

end

module Hand
attr_accessor :hand

  def initialize
    @hand = []
  end

  def deal(cards)
    hand += (cards.deal_one)
  end
end


class Player
include Hand

  def initialize
    puts "Welcome to blackjack! What's your name?"
    @name = gets.chomp
   
  end
end

class Dealer
include Hand

  def initialize
 
  end

end

Game.new.play