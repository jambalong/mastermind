require_relative 'lib/game'

game = Game.new(Player.new(:code_maker), Computer.new(:code_breaker))
game.play
