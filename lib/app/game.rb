require 'bundler'
Bundler.require
$:.unshift File.expand_path('./../lib', __FILE__)
require 'view/board'
require 'app/player'
require 'view/boardcase'

class Game

  attr_accessor :num_round, :player_1, :player_2, :board_game_instance

  def initialize(first_player, second_player)
    @num_round = 0
    @player_1 = first_player
    @player_2 = second_player
    @board_game_instance = Board.new
  end

  

end
