require_relative 'lib/game'

game = Game.new(Player.new(:code_breaker), Computer.new(:code_maker))
game.play
