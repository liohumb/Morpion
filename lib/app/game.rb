require 'bundler'
Bundler.require
$:.unshift File.expand_path('./../lib', __FILE__)
require 'view/board'
require 'app/player'
require 'view/boardcase'

class Game

  attr_accessor :num_round, :player_1, :player_2, :board_game_instance

  

end
