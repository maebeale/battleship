require './ship'

class Battleship
end

ship1 = Ship.new(4)
ship1.place(2, 1, true)
ship2 = Ship.new(4)
ship2.place(3, 1, true)
ship3 = Ship.new(4)
ship3.place(2, 1, false)
