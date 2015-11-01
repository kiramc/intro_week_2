@board = {1=>" ", 2=>" ", 3=>" ", 4=>" ", 5=>" ", 6=>" ", 7=>" ", 8=>" ", 9=>" "}

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

@board.draw