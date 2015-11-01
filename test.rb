# try to allow player to pick their own piece

# module Pieces
#   OPTIONS = ['x', 'o']

#   def remove_players_choice
#     OPTIONS.delete(piece)
#   end

# end


# class Human
# attr_reader :piece
# include Pieces

#   def initialize
#     puts "Welcome to TicTacToe!\nWhat's your name?"
#     @name = gets.chomp
#     puts "Do you want to be 'x' or 'o'?" until OPTIONS.include?(@piece)
#     @piece = gets.chomp.downcase
#     remove_players_choice
#   end # returns Human object with a name and piece
 
# end

# class Computer
# include Pieces

#   def initialize
#     @name = "Computer"
#     @piece = OPTIONS.last
#   end

# end


def play
  loop do
    puts "GAME LOGIC HERE"
    puts "again?"
    answer = gets.chomp.downcase
    answer == "y" ? redo : (puts "Thanks for playing!")
    break
  end
end

play

