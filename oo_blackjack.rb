class Game
  attr_reader :player, :dealer, :deck

  def initialize
    @deck = Deck.new
    @player = Player.new
    @dealer = Dealer.new
    puts "Welcome to blackjack!"
  end

  def play
    reset
    initial_deal
    show_initial_hands
    first_check
    players_turn
    dealers_turn
    compare_hands
  end
 
  def reset
    deck.reset
    player.reset
    dealer.reset
  end

  def initial_deal
    2.times { player.deal(deck.one_card) }
    2.times { dealer.deal(deck.one_card) }
  end

  def show_initial_hands
    puts "The dealer has: #{dealer.show_cards} for a total of #{dealer.calculate_total}."
    puts "You have: #{player.show_cards} for a total of #{player.calculate_total}."
  end

  def first_check
    if dealer.calculate_total == 21
      puts "Whoa that's lucky! Dealer hit blackjack, sorry. Game over."
      wants_to_play_again?
    elsif player.calculate_total == 21
      puts "Whoa that's lucky! You hit blackjack. Congratulations, you win!"
      wants_to_play_again?
    end
  end

  def check_player_hand
    if player.hit_blackjack?
      puts "Congratulations! You hit blackjack, you win."
      wants_to_play_again?
    elsif player.is_busted?
      puts "Oh no! Looks like you busted. Sorry, you lose."
      wants_to_play_again?
    end
  end

  def check_dealer_hand
    if dealer.hit_blackjack?
      puts "Oh no! Dealer hit blackjack. Sorry, you lose."
      wants_to_play_again?
    elsif dealer.is_busted?
      puts "Dealer busts! Congratulations, you win."
      wants_to_play_again?
    end
  end

  def players_turn
    while player.calculate_total < 21
      puts "Do you want to hit ('h') or stay ('s')?"
      hit_or_stay = gets.chomp
      
      if hit_or_stay == 'h'
        player.deal(deck.one_card)
        puts "You chose hit. Your new card is #{player.hand.last[1]}#{player.hand.last[0]}, for a total of #{player.calculate_total}."
        check_player_hand
      elsif hit_or_stay == 's'
        puts "You chose to stay with a total of #{player.calculate_total}.\nNow for the dealer's turn."
        break
      else
        puts "That's an invalid selection. Choose 'h' to hit, 's' to stay."
      end
    end
  end

  def dealers_turn
    while dealer.calculate_total < 17
      puts "Dealing the dealer another card..."
      dealer.deal(deck.one_card)
      puts "Dealer's new card is #{dealer.hand.last[1]}#{dealer.hand.last[2]}, for a total of #{dealer.calculate_total}."
      check_dealer_hand
    end
  end

  def compare_hands
    puts "Dealer stays with #{dealer.show_cards}, for a total of #{dealer.calculate_total}."
    
    if player.calculate_total > dealer.calculate_total
      puts "Congratulations! You win!"
    elsif player.calculate_total < dealer.calculate_total
      puts "Oh no, looks like dealer wins. Maybe next time."
    else
      puts "It's a tie!"
    end

    wants_to_play_again?
  end

  def wants_to_play_again?
    puts "Do you want to play again? (y/n)"
    answer = gets.chomp
    if answer == 'y'
      puts "Great! Setting up new game ..."
      play
    else
      puts "Thanks for playing! Goodbye."
      exit
    end
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

  def is_busted?
    calculate_total > 21
  end

  def hit_blackjack?
    calculate_total == 21
  end


  def reset
    @hand = []
  end


end

class Player
  include Hand

  def initialize
  end
end


class Dealer
  include Hand

  def initialize
  end
end

Game.new.play