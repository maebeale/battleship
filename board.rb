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
    ship.place(x, y, across)
    if @fleet.any? { |s| s.overlaps_with?(ship) }
      return false
    else
      @fleet << ship
    end

  end

end

