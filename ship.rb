class Ship
  def initialize(length)
    @length = length
    @ship_squares = []
    @placed = false
  end

  def length
    @length
  end

  # creates an array of squares the ship will occupy when placed
  def ship_squares(x, y, across)
    placement_count = @length
    if across == true
      while placement_count > 0
        [x, y]
        @ship_squares << [x, y]
        x += 1
        placement_count -= 1
      end
    else #across = false
      while placement_count > 0
        [x, y]
        @ship_squares << [x, y]
        y += 1
        placement_count -= 1
      end
    end
    @ship_squares
  end

  # places ship on board. boolean toggle for orientation: across == true
  def place(x, y, across)
    unless @ship_squares.include?([x,y])
      ship_squares(x, y, across)
      @placed = true
    end
    return @placed
  end

  # assesses if ship is on a specific square
  def covers?(x, y)
    @ship_squares.include?([x,y])
  end

end