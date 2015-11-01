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

  def initialize
    self.board = {}
    (1..9).each { |position| position = self.board[position] = " " }
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

end

class Player
  attr_reader :player_marker, :name
  attr_accessor :markers

  def initialize
    puts "Welcome to Tic Tac Toe! What's your name?"
    @name = gets.chomp
    @positions_occupied = []
  end


  def chooses_position
    puts "Choose an available position."
    player_choice = gets.chomp.to_i
    if board.empty_positions.include?(player_choice)
      positions_occupied << player_choice
      board[player_choice] = self.player_marker
    else
      puts "That's not a valid selection!"
    end
  end

end

# class Computer
#   attr_reader :name

#   def initialize(name)
#     @name = name




# __________________________________________________________________



# class Player
  
#   def initialize
#     puts "Welcome to Tic Tac Toe! What's your name?"
#     @name = gets.chomp
#     puts "Do you want to be 'X' or 'O'?"
#     @piece = gets.chomp
#     @positions_occupied = []
#   end

#   def chooses_position
#     puts "Choose an available position."
#     player_choice = gets.chomp.to_i
#   end

#   def places_piece
#     positions_marked = []
#     player_choice << positions_marked
#   end
# end

# class Computer
# end

# class Marker
#   MARKERS = ['x', 'o']

#   def choose_marker
#     puts 
#   end
# end

class Game
  attr_accessor :board

  def initialize
    @human = Player.new
    # @computer = Computer.new("R2D2")
    @board = Board.new
    @current_player = @human
  end

  def play
    
    puts "Welcome to Tic Tac Toe!"
    board.draw
    p board.empty_positions
    @human.chooses_marker
    @human.choose

    

  end

end



tic_tac_toe = Game.new.play

binding.pry
