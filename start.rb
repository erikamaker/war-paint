class Curses
  def display(squares)                                      
    squares.each {|row| puts row.join}                     # For each element in coords, join as a string and output it with a new line. 
  end
  def empty_square
    "⬚ "
  end
end


class Board
  attr_reader :rows, :cols
  def initialize(rows,cols)
    @rows, @cols = rows, cols
  end
  def grid(square_type)
    Array.new(rows) {Array.new(cols, square_type) }        # Make 2D array (for each @row, a square is printed based on what preset is selected). 
  end
end


board = Board.new(5,4)
renderer = Curses.new


loop do 
  renderer.display(board.grid(renderer.empty_square))      # Curses instance creates a grid of the preset for empty squares, defined in Curses. 
  print "Select `Q` to Quit  >>  "                         # Prompt for...
  input = gets.chomp.downcase                              # ... and accept input.
  exit! if input == 'q'                                    # Exit program. 
end

