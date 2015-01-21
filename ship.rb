# include 'set'

class Ship
  attr_accessor :length, :squares, :hit_count

  def initialize(length)
    @length = length
    @squares = []
    @shots_fired = []
  end

  # creates an array of squares the ship will occupy when placed
  def projected_squares(x, y, across)
    count = 0
    resulting_squares = []
    if across == true
      while count < @length
        resulting_squares << [x, y]
        x += 1
        count += 1
      end
    else #across == false
      while count < @length
        resulting_squares << [x, y]
        y += 1
        count += 1
      end
    end
    resulting_squares
  end

  # must be called from within board for projected_squares to be squares_covered.
  # 3rd argument is a boolean toggle for orientation. default: across == true
  def place(x, y, across)
    if @squares.empty?
      @squares = projected_squares(x, y, across)
      return true
    end
    return false
  end

  # assesses if ship is on a specific square
  def covers?(x, y)
    if @squares == []
      return false
    else
      @squares.include?([x,y])
    end
  end

  def overlaps_with?(other_ship)
    # compare the following two arrays:
    if (self.squares & other_ship.squares).empty?
      return false
    else
      return true
    end
  end

  def fire_at(x, y)
    if covers?(x,y)
      @shots_fired << [x,y]
    end
  end

  def sunk?
    @shots_fired.sort == @squares.sort
  end

end

# puts "#{ship.inspect}"

