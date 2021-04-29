require 'bundler'
Bundler.require
$:.unshift File.expand_path('./../lib' __FILE__)
require 'app/player'
require 'view/board'
require 'app/game'
require 'view/boardcase'

class Application

  attr_accessor :player_1, :player_2, :next_party

end
