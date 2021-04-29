require 'bundler'
Bundler.require
$:.unshift File.expand_path('./../lib', __FILE__)
require 'view/board'
require 'app/player'
require 'view/boardcase'

class Show

  attr_accessor :board_case_array

  def initialize(board_game_instance)
    @board_case_array = board_game_instance
  end

end
