class Board

  def initialize
    @board = {1=>" ", 2=>" ", 3=>" ", 4=>" ", 5=>" ", 6=>" ", 7=>" ", 8=>" ", 9=>" "}
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
    puts " #{display(1)} | #{display(2)} | #{display(3)}"
    puts "---+---+---"
    puts " #{display(4)} | #{display(5)} | #{display(6)}"
    puts "---+---+---"
    puts " #{display(7)} | #{display(8)} | #{display(9)}"
  end
end

board = Board.new
board.draw


  # def alternate_player
  #   if @current_player == @human
  #     @current_player = @computer
  #   else
  #     @current_player = @human
  #   end
  # end


  system "clear"
  puts "              |         |\n      
         #{display(1)}    |    #{display(2)}    |    #{display(3)}\n
              |         |\n
    ----------+---------+---------\n
              |         |\n       
         #{display(4)}    |    #{display(5)}    |    #{display(6)}\n     
              |         |\n   
    ----------+---------+---------\n
              |         |\n
         #{display(7)}    |    #{display(8)}    |    #{display(9)}\n
              |         |\n\n"
