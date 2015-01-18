require './ship'
class Board
  attr_accessor :ships, :squares_covered

  def initialize
    @ships = []
    @squares_covered = []
  end

  def has_ship_on?(x, y)
    unless @ships == []
      while @ships.any? { |s| s.covers?(x, y) }
        return true
      end
      return false
    end
    return false
  end

  def place_ship(ship, x, y, across)
    if ships.include?(ship)
      puts "Can't place the ship twice"
    elsif board_overlaps_with?(ship) == false
      ship.place(x, y, across)
      ship.squares.each { |ss|  @squares_covered << ss }
     # @squares_covered << ship.squares
      @ships << ship #TODO ok to end method w this?
      puts "Ship was placed."
    else
      raise "Can't overlap ships!"
    end

  end

  def board_overlaps_with?(ship)
    #if ship.squares.any? { |ss| self.has_ship_on?(ss[0],ss[1]) }
    if ship.squares.any? { |ss| self.has_ship_on?(ss[0],ss[1]) }
     return true
    else
      return false
    end


    # unless @ships == []
    #   while @ships.any? { |s| s.overlaps_with?(ship) }
    #     return true
    #   end
    #   return false
    # end
    # return false
  end

end
board = Board.new
ship1 = Ship.new(4)
ship2 = Ship.new(4)
puts "ships..................: #{board.ships.length}"
print "putting ship1 on board:" + " #{board.place_ship(ship1, 3, 3, true)} \n"
print "putting ship2 on board:" + " #{board.place_ship(ship2, 3, 3, true)} \n"
puts "ships..................: #{board.ships.length}"
# p "board: #{board.squares_covered}"
# # p "board ships: #{board.ships}"
# p "ship1: #{ship2.squares}"
# p "ship2: #{ship2.squares}"
#
# puts "ship1 covers 3,3: #{board.ships.first.covers?(3,3)}"
# puts "ship2 covers 6,3: #{board.ships.second.covers?(6,3)}"
# puts "board has ship on 2,3: #{board.has_ship_on?(2,3)}"
# puts "board has ship on 3,3: #{board.has_ship_on?(3,3)}"
# puts "board overlaps with ship1: #{board.ships.first.overlaps_with?(ship1)}"
# puts "board overlaps with ship2: #{board.ships.first.overlaps_with?(ship2)}"
# puts "#{board.place_ship(ship2, 1, 3, true)}"
#
# puts "number of ships on board: #{board.ships.length}"
# # puts "covers result: #{board.ships.first.covers?(1,1)}"
# # puts board.ships.first.squares.include?([1,1])
# # if board.has_ship_on?(1, 1)
# #   puts "yes, has ship on 1,1"
# # else
# #   puts 'no'
# # end
# # puts "has ship on: #{    unless @ships != []
# #                            @ships.any? { |s| s.covers?(x, y)}
# #                            return true
# #                          end
# # return false}"
