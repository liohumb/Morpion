require 'bundler'
Bundler.require
$:.unshift File.expand_path('./../lib', __FILE__)
require 'view/boardcase'
require 'view/show'
require 'app/player'

class Board

  attr_accessor :board_case_name_array, :num_round, :show_instance
  @@all_board = Array.new

  def initialize

    a1 = BoardCase.new("A1")
    a2 = BoardCase.new("A2")
    a3 = BoardCase.new("A3")
    b1 = BoardCase.new("B1")
    b2 = BoardCase.new("B2")
    b3 = BoardCase.new("B3")
    c1 = BoardCase.new("C1")
    c2 = BoardCase.new("C2")
    c3 = BoardCase.new("C3")

    @board_case_name_array = [a1, a2, a3, b1, b2, b3, c1, c2, c3]

    @show_instance = Show.new(@board_case_name_array)
    @num_round = 0
    @@all_board << self

  end

  def board_to_show
    @show_instance.live_board
  end

  def board_menu
    @show_instance.live_board
  end

  def board_show_draw
    @show_instance.live_board
    puts "• Oupss.. Aucun de vous n'a gagné :) •"
  end

end
