class BotSavePrincess
  attr_reader :size, :mario_row_position, :mario_column_position, :grid

  def initialize(size, row, column, grid)
    @size    = size
    @grid    = grid
    @mario_row_position = row
    @mario_column_position = column
  end

  def next_move
    princess_cord = princess_position
    cols = princess_cord[0] - mario_column_position
    rows = princess_cord[1] - mario_row_position
    if rows != 0
      puts rows < 0 && "UP" || "DOWN"
    elsif cols != 0
      puts cols < 0 && "LEFT" || "RIGHT"
    end
  end

  def princess_position
    princess = []
    grid.each_with_index do |line, index|
      if line.include?("p")
        princess.push(line.chars.index("p"))
        princess.push(index)
      end
    end
    princess
  end
end
