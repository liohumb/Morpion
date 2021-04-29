require 'bundler'
Bundler.require
$:.unshift File.expand_path('./../lib', __FILE__)
require 'view/boardcase'
require 'view/show'
require 'app/player'

class Board

  attr_accessor :board_case_name_array, :num_round, :show_instance
  @@all_board = Array.new

end
