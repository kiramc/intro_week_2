# Tic Tac Toe

# draw the board
# 2 players
#   - player 1 picks x or o, ask their name

# game play:
#   Player 1 picks a square
#     - check if someone won
#   Player 2 picks a square
#     - check if someone won
#   repeat until someone gets 3 in a row
#   if no one gets 3 in a row, it's a tie.

#   ask if they want to play again

require 'pry'

class Board
  attr_accessor :board

  POSITIONS = [1, 2, 3, 4, 5, 6, 7, 8, 9]

  def initialize
    @board = {}
    (1..9).each { |position| position = board[position] = " " }
  end

  def draw
    system "clear"
    puts " #{board[1]} | #{board[2]} | #{board[3]} "
    puts "---+---+---"
    puts " #{board[4]} | #{board[5]} | #{board[6]}"
    puts "---+---+---"
    puts " #{board[7]} | #{board[8]} | #{board[9]}"    
  end
  
  def empty_positions
    board.select { |position, status| status = " " }.keys
  end

  def to_s(index)
    board[index].key
  end




binding.pry


end

class Player
  def choose_marker
    markers = ['x', 'o']
    puts "Do you want to be X or O?"
    player_marker = gets.chomp.downcase
  end

  def chooses_position
    puts "Choose an available position."
    @player_choice = gets.chomp.to_i
  end

  def places_piece
    positions_marked = []
    @player_choice << positions_marked
  end
end

class Computer
end

class Marker
  MARKERS = ['x', 'o']

  def choose_marker
    puts 
  end
end

class Game
  attr_accessor :board

  def initialize
    @human = Player.new
    @computer = Computer.new
    @board = Board.new
    @current_player = @human
  end

  def play
    
    puts "Welcome to Tic Tac Toe!"
    board.draw
    p board.empty_positions
    @current_player.places_piece

  end

end



tic_tac_toe = Game.new.play

binding.pry
