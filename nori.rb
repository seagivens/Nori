require './obstacles.rb'
require './engine.rb'

a_map = Map.new('nori')
a_game = Engine.new(a_map)
a_game.play()
