require 'pry'

class Game
  attr_reader :player, :dealer, :cards

  def initialize
    @cards = Deck.new
    @player = Player.new
    @dealer = Dealer.new
  end

  def reset
    cards.reset
    player.reset
    dealer.reset

  end

  def play
    reset
    initial_deal
    
    puts "The dealer has: #{dealer.show_cards} for a total of #{dealer.calculate_total}."
    puts "You have: #{player.show_cards} for a total of #{player.calculate_total}."

    first_check
    wants_to_play_again? ? play : exit

  end

  def initial_deal
    2.times { player.deal(cards.one_card) }
    2.times { dealer.deal(cards.one_card) }
  end

  def first_check
    if dealer.calculate_total == 21
      puts "Whoa that's lucky! Dealer hit blackjack, sorry. Game over."
      wants_to_play_again? ? reset : exit
    elsif player.calculate_total == 21
      puts "Whoa that's lucky! You hit blackjack. Congratulations, you win!"
      wants_to_play_again? ? reset : exit
    end
  end

  def wants_to_play_again?
    puts "Do you want to play again? (y/n)"
    answer = gets.chomp
    answer == "y"
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
  end

  def reset
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
    end

      #correct for aces
    array_of_faces.count { |face| face == "A" }.times do
      total -= 10 if total > 21
    end
    total
  end

  def show_cards
    hand.map { |pair| "#{pair[1]}#{pair[0]}" }.join(", ")
  end

  def reset
    hand = []
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