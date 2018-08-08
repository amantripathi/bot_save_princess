class BotSavePrincess
  attr_reader :size, :grid

  def initialize(size, grid)
    @size = size
    @grid = grid
  end

  def route_to_princess
    moves = []
    princess_cord = princess_position
    mario_cord = mario_position
    cols = princess_cord[0] - mario_cord[0]
    rows = princess_cord[1] - mario_cord[1]
    rows < 0 && moves.push("UP\n" * rows.abs) || moves.push("DOWN\n" * rows)
    cols < 0 && moves.push("LEFT\n" * cols.abs) || moves.push("RIGHT\n" * cols)
    moves.each {|move| puts move}
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

  def mario_position
    mario = []
    grid.each_with_index do |line, index|
      if line.include?("m")
        mario.push(line.chars.index("m"))
        mario.push(index)
      end
    end
    mario
  end
end
