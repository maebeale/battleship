require './ship'

class Board
  attr_accessor :fleet, :squares_covered

  def initialize
    @fleet = []
    @squares_covered = []
  end

  def has_ship_on?(x, y)
    unless @fleet == []
      while @fleet.any? { |s| s.covers?(x, y) }
        return true
      end
      return false #TODO - both of these return falses needed?
    end
    return false
  end

  def place_ship(ship, x, y, across)
    ship.projected_squares(x,y, across)
    if ship.possible_squares.any? { |ss| self.has_ship_on?(ss[0],ss[1]) }
      raise "Can't overlap ships!"
      return  #TODO - is this needed here?
    else
      ship.place(x, y, across)
      ship.squares.each { |ss| @squares_covered << ss }
      @fleet << ship
      return #TODO - is this needed here?
    end
  end

end

# board = Board.new
# ship1 = Ship.new(4)
# ship2 = Ship.new(4)
# puts "0- #{board.fleet.length} ships on board, with covered squares = #{board.squares_covered} -0"
# board.place_ship(ship1, 3, 3, true)
# print "1- ship1 squares: #{ship1.squares} -1 \n"
# puts "2- #{board.fleet.length} ships, with covered squares = #{board.squares_covered} -2"
# puts "3- ships on board: #{board.fleet.inspect} -3"
#
