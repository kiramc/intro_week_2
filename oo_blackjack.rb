require 'pry'

class Game
  attr_reader :player, :dealer, :deck

  def initialize
    @deck = Deck.new
    @player = Hand.new('Player')
    @dealer = Hand.new('Dealer')
    say "Welcome to blackjack!\n"
  end

  def play
    reset
    initial_deal
    say show_initial_hands
    say first_check
    players_turn
    dealers_turn
    compare_hands
  end

  def say(message) #"views" method
    if message.is_a?(String)
      message.length.times do |character|
        print message[character]
        sleep 0.02
      end
    else
      return
    end
  end

  def reset #resets all data to initial values
    deck.reset
    player.reset
    dealer.reset
  end

  def initial_deal #gives each player 2 cards
    2.times { player.deal(deck.one_card) }
    2.times { dealer.deal(deck.one_card) }
  end

  def show_initial_hands #returns a string showing initial hands
    "The dealer has: #{dealer.show_cards} for a total of #{dealer.calculate_total}.\nYou have: #{player.show_cards} for a total of #{player.calculate_total}.\n"
  end

  def first_check
    if dealer.calculate_total == 21
      "Whoa that's lucky! Dealer hit blackjack, sorry. Game over.\n"
    elsif player.calculate_total == 21
      "Whoa that's lucky! You hit blackjack. Congratulations, you win!\n"
    else
      return
    end
  end

  def check(either) #checks if hand is busted or blackjack, returns a message
    if either.hit_blackjack?
      "#{either.name} wins.\n"
    elsif either.is_busted?
      "#{either.name} busted!"
    else
      return #'stay' message should go here
    end
    wants_to_play_again?
  end

  def players_turn
    until player.is_busted?
      say "Do you want to hit ('h') or stay ('s')?\n"
        choice = gets.chomp
      if choice == 'h'
        player.deal(deck.one_card)
        say "You chose hit. Your new card is #{player.hand.last}, for a total of #{player.calculate_total}.\n"
        say check(player)
      elsif choice == 's'
        say "You chose to stay with a total of #{player.calculate_total}.\nNow for the dealer's turn.\n"
        return
      else
        say "That's an invalid selection. Choose 'h' to hit, 's' to stay.\n"
      end
    end
  end

  def dealers_turn
    while dealer.calculate_total < 17
      say "Dealing the dealer another card...............\n"
      dealer.deal(deck.one_card)
      say "Dealer's new card is #{dealer.hand.last}, for a total of #{dealer.calculate_total}.\n"
      say check(dealer)
    end
    "Dealer stays with #{dealer.show_cards}, for a total of #{dealer.calculate_total}.\n"
  end

  def compare_hands    
    if player.calculate_total > dealer.calculate_total
      "Congratulations! You win!\n"
    elsif player.calculate_total < dealer.calculate_total
      "Oh no, looks like dealer wins. Maybe next time.\n"
    else
      "It's a tie!\n"
    end
  end

  def wants_to_play_again?
    say "Do you want to play again? (y/n)"
    answer = gets.chomp
    if answer == 'y'
      say "Great! Setting up new game ..."
      play
    else
      say "Thanks for playing! Goodbye.\n"
      exit
    end
  end

end

class Card
  attr_reader :value, :suit

  def initialize(value, suit)
    @value = value
    @suit = suit
  end

  def to_s #returns a string showing the card
    "#{value}#{suit}"
  end
end

class Deck
  attr_accessor :cards

  def initialize
    @cards = []
  end

  def reset #returns a deck of cards
    %w(2 3 4 5 6 7 8 9 10 J K Q A).each do |value|
      %w(♣ ♥ ♠ ♦).each do |suit|
        cards << Card.new(value, suit)
      end
    end
    cards.shuffle!    
  end

  def one_card #returns a new card
    cards.pop
  end
end

class Hand
  attr_accessor :hand
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def reset
    @hand = []
  end

  def deal(card) #shovels a new card into the hand
    hand << card
  end

  def calculate_total #returns hand total
    array_of_faces = hand.map { |card| card.value }
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

  def show_cards #returns string of cards in hand
    hand.map { |card| card.to_s }.join(", ")
  end

  def is_busted? #returns true or false
    calculate_total > 21
  end

  def hit_blackjack? #returns true or false
    calculate_total == 21
  end
end

Game.new.play