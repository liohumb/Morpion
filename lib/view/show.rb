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

  def live_menu

    puts "Choisis une case (disponible)"

    num_box = 1

    @board_case_array.each do |box|
      if box.box_value == ""
        puts "#{num_box} - #{box.box_name}"
      end
      num_box += 1
    end

    print " •  "

  end

end
