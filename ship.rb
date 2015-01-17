
class Ship
  attr_accessor :length #, :ship_squares, :placement_count

  def initialize(length)
    @length = length
    @ship_squares = []
    @placement_count = 0
  end

  # creates an array of squares the ship will occupy when placed
  def ship_squares(x, y, across)
    square_count = @length
    if across == true
      while square_count > 0
        [x, y]
        @ship_squares << [x, y]
        x += 1
        square_count -= 1
      end
    else #across = false
      while square_count > 0
        [x, y]
        @ship_squares << [x, y]
        y += 1
        square_count -= 1
      end
    end
    @ship_squares
  end

  # places ship on board. boolean toggle for orientation: across == true
  def place(x, y, across)
    unless @ship_squares.include?([x,y]) || @placement_count == 1
      ship_squares(x, y, across)
      @placement_count += 1
    end
  end

  # assesses if ship is on a specific square
  def covers?(x, y)
    @ship_squares.include?([x,y])
  end

  def overlaps_with?(ship_name)
    # compare the following two arrays:
    # ship1.place(1,2,true).ship_squares
    # ship2.place(1,2,false).ship_squares
  end

end