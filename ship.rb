# include 'set'

class Ship
  attr_accessor :length, :squares, :hit_count

  def initialize(length)
    @length = length
    @squares = []
    @shots_fired = []
  end

  # must be called from within board for projected_squares to be squares_covered.
  # 3rd argument is a boolean toggle for orientation. default: across == true
  def place(x, y, across)
    if @squares.empty?
      if across == true
        @length.times do |i|
          @squares << [x+i, y]
        end
      else #across == false
        @length.times do |i|
          @squares << [x, y+i]
        end
      end
      @squares
    end
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

