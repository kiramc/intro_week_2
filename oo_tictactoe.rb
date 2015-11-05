require 'pry'

class Game
  def initialize
    @human = Human.new
    @computer = Computer.new
    @board = Board.new
    @current_player = @human
  end

  def alternate_player
    if @current_player == @human
      @current_player = @computer
    else
      @current_player = @human
    end
  end

  def wants_to_play_again?
    puts "Do you want to play again? (y/n)"
    answer = gets.chomp.downcase
    return true if answer == "y"
    nil
  end

  def reset
    @board.erase
    @board.draw
    @current_player = @human
  end

  def play
    puts "Hi there! Welcome to tic tac toe."
    @human.ask_for_name
    @human.chooses_marker
    @computer.gets_marker(@human.marker)
    reset
      
      loop do
        @current_player.chooses_square_on(@board)
        if @board.three_in_a_row?(@current_player.marker)
          puts "#{@current_player.name} wins!"
          wants_to_play_again? ? reset : break
        elsif @board.available_positions.empty?
          puts "It's a tie!"
          wants_to_play_again? ? reset : break
        else
          alternate_player
        end
      
      end
  end
end

class Player
  attr_reader :name, :marker

  def initialize
    @name = "Computer"
    @marker = nil
  end

  def ask_for_name
    puts "What's your name?"
    @name = gets.chomp
  end

end

class Human < Player
  def chooses_square_on(board)
    puts "Pick an available square:"
    player_choice = gets.chomp.to_i
      loop do
        break if board.available_positions.include?(player_choice)
        puts "That's an invalid selection! Choose from the available options."
        player_choice = gets.chomp.to_i
      end
    board[player_choice] = @marker
    board.draw
  end

  def chooses_marker
    puts "Do you want to be 'x' or 'o'?"
    choice = gets.chomp.downcase
    loop do
      break if ['x', 'o'].include?(choice)
      puts "That's not an option! Choose 'x' or 'o'."
      choice = gets.chomp.downcase
    end
    @marker = choice
  end
end

class Computer < Player
  def chooses_square_on(board)
    computer_choice = board.available_positions.sample
    board[computer_choice] = @marker
    board.draw
  end

  def gets_marker(human_marker)
    if human_marker == "x"
      @marker = "o"
    else
      @marker = "x"
    end
  end
end

class Board
WINNING_LINES = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7]]

  def initialize
    @data = {}
  end

  def erase
    (1..9).each { |position| @data[position] = " " }
  end

  def display(position)
    if @data[position] == " "
      position
    else
      @data[position]
    end
  end

  def draw
  system "clear"
  puts " #{display(1)} | #{display(2)} | #{display(3)}"
  puts "---+---+---"
  puts " #{display(4)} | #{display(5)} | #{display(6)}"
  puts "---+---+---"
  puts " #{display(7)} | #{display(8)} | #{display(9)}"
  end

  def [](position)
    @data[position]
  end

  def []=(position, piece)
    @data[position] = piece
  end

  def available_positions
    @data.keys.select{ |position| @data[position] == " " }
  end

  def three_in_a_row?(marker)
    WINNING_LINES.each do |line|
    return true if @data.values_at(*line).count(marker) == 3
    end
    nil
  end
end

Game.new.play
