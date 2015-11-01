require 'pry'

class Game

  def initialize
    @human = Human.new("Kira", "x")
    @computer = Computer.new("Computer", "o")
    @board = Board.new
  end

  def play
    @board.draw
  end
end

class Player
  def initialize (name, marker)
    @name = name
    @marker = marker
  end
end

class Human < Player
  
end

class Computer < Player
 
end

module Markable
  def mark_this(position)

  end
end

class Board
include Markable

  def initialize
    @board = {}
    (1..9).each { |position| @board[position] = " " }
  end

  def display(position)
    if @board[position] == " "
      position
    else
      @board[position]
    end
  end

  def draw
    system "clear"
    puts " #{@board.display(1)} | #{@board.display(2)} | #{@board.display(3)}"
    puts "---+---+---"
    puts " #{@board.display(4)} | #{@board.display(5)} | #{@board.display(6)}"
    puts "---+---+---"
    puts " #{@board.display(7)} | #{@board.display(8)} | #{@board.display(9)}"
  end
end

binding.pry
