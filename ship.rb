# include 'set'

class Ship
  attr_accessor :length, :possible_squares, :squares, :placement_count, :hit_count

  def initialize(length)
    @length = length
    @possible_squares = []
    @squares = []
    @placement_count = 0
    @hit_count = 0
  end

  # creates an array of squares the ship will occupy when placed
  def projected_squares(x, y, across)
    count = 0
    @possible_squares = []
    if across == true
      while count < @length
        @possible_squares << [x, y]
        x += 1
        count += 1
      end
    else #across == false
      while count < @length
        @possible_squares << [x, y]
        y += 1
        count -= 1
      end
    end
  end

  # must be called from within board for projected_squares to be squares_covered.
  # 3rd argument is a boolean toggle for orientation. default: across == true
  def place(x, y, across)
    if @placement_count == 0 #&& !@squares.include?([x,y])
      projected_squares(x, y, across)
      @possible_squares.each { |ps| @squares << ps }
      @placement_count += 1
    end
    # else  #@squares.include?([x,y]) || @placement_count == 1
    #   # raise "Can't place this ship again"
    #   # return false#TODO problem is either here
    #   # return #false
    # end
    # return false#TODO or here...
  end

  # assesses if ship is on a specific square
  def covers?(x, y)
    puts "#{ship.inspect}"
    if @squares == []
      return false
    elsif @squares.include?([x,y])
      return true
    else
      return false
    end
  end

  def overlaps_with?(other_ship)
    # compare the following two arrays:
    other_ship.projected_squares.any? { |ss| self.covers?(ss[0],ss[1]) }
  end

  def fire_at(x, y)
    if covers?(x,y)
      @squares.delete([x,y])
      hit_count += 1
    end
  end

  def sunk?
    if @squares == [] || @hit_count == length #TODO - only need one of these
      return true
    else
      return false
    end
  end

end

# # test 3
# ship = Ship.new(4)
# puts "#{ship.inspect}"
# ship.place(2, 2, false)
# puts "#{ship.inspect}"
# ship.covers?(2, 1)
# ship.covers?(2, 2)
# ship.covers?(2, 3)
# ship.covers?(2, 4)
# ship.covers?(2, 5)
# ship.covers?(2, 6)
# ship.covers?(3, 2)


# test 4
# ship = Ship.new(4)
# puts "#{ship.inspect}"
# ship.place(2, 1, true)
# puts "#{ship.inspect}"
# ship.place(3, 2, false)
# puts "#{ship.inspect}"

# general checks
# ship1 = Ship.new(4)
# ship2 = Ship.new(4)
# puts "0- #{ship1.inspect} -0"
# puts "1- ship1.squares: #{ship1.length} -1"
# print "2- #{ship1.place(3, 3, true)} -2 \n"
# puts "3- #{ship1.inspect} -3"