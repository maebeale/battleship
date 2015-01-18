# include 'set'

class Ship
  attr_accessor :length, :squares #, :placement_count

  def initialize(length)
    @length = length
    @squares = []
    @placement_count = 0
  end

  # creates an array of squares the ship will occupy when placed
  def squares_calc(x, y, across)
    square_count = @length
    if across == true
      while square_count > 0
        [x, y]
        @squares << [x, y]
        x += 1
        square_count -= 1
      end
    else #across = false
      while square_count > 0
        [x, y]
        @squares << [x, y]
        y += 1
        square_count -= 1
      end
    end
    @squares
  end

  # places ship on board. boolean toggle for orientation: across == true
  def place(x, y, across)
    if @squares.include?([x,y]) || @placement_count == 1
      raise "can't place this ship"
    else
      @placement_count += 1
      squares_calc(x, y, across)
    end
  end

  # assesses if ship is on a specific square
  def covers?(x, y)
    if @squares.include?([x,y])
      return true
    else
      return false
    end
  end

  def overlaps_with?(other_ship)
    # compare the following two arrays:
    other_ship.squares.any? { |ss| self.covers?(ss[0],ss[1]) }
  end

  def fire_at(x, y)
    if covers?(x,y)
      @squares.delete([x,y])
    end

  end

  def sunk?
    if squares == []
      return true
    end
    return false
  end

end