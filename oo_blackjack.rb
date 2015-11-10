require 'pry'

class Game
  attr_reader :player, :dealer, :cards

  def initialize
    @cards = Deck.new
    @player = Player.new
    @dealer = Dealer.new
  end

  def play
    2.times { player.deal(cards.one_card) }
    2.times { dealer.deal(cards.one_card) }
    puts player.hand

  end


end

class Card
  def initialize(suit, value)
    @suit = suit
    @value = value
  end

  def display
    puts "The #{value} of #{suit}"
  end
end

class Deck
  attr_reader :suits, :values
  attr_accessor :deck

  def initialize
    @suits = %w(♣ ♥ ♠ ♦)
    @values = %w(2 3 4 5 6 7 8 9 10 J K Q A)
    @deck = suits.product(values)
    deck.shuffle!
  end

  def one_card
    deck.pop
  end

end

module Hand
attr_accessor :hand

  def deal(card)
    hand << card
  end

  def calculate_total
    array_of_faces = hand.map { |pair| pair[1] }
    total = 0

    array_of_faces.each do |face|
      if face == "A"
        total += 11
      elsif ["J", "Q", "K"].include?(face)
        total += 10
      else
        total += face.to_i
      end

      #correct for aces
      array_of_faces.count { |face| face == "A" }.times do
        total -= 10 if total > 21
      end
  end
end


class Player
include Hand

  def initialize
    @name = "Kira"
    @hand = []
  end




end

class Dealer
include Hand

  def initialize
    @hand = []
  end



end

Game.new.play