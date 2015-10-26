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
  def initialize
    @board = {}
    (1..9).each { |position| position = @board[position] = " " }
  end

  def list_empty_positions
    @board.select { |position, status| status = " " }.keys
  end




end

class Player
  def places_piece
    puts "Choose an available position."
    player_choice = gets.chomp.to_i
  end
end

class Computer
end

class Marker
end

class Game
  def initialize
    @human = Player.new
    @computer = Computer.new
    @board = Board.new
    @current_player = @human
  end

  def play
    
    puts "Welcome to Tic Tac Toe!"
    puts @board.list_empty_positions
    @current_player.places_piece

  end

end



tic_tac_toe = Game.new.play

binding.pry
