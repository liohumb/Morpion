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

  def results(player_1, player_2)
    puts ""
    puts "Un point sur le score :"
    puts "•——————————————————————————————•"
    print "|"
    print "• #{player_1.name} •".center(15)
    print "|"
    print "• #{player_1.score} •".center(15)
    print "|"
    puts "•——————————————————————————————•"
    print "|"
    print "• #{player_2.name} •".center(15)
    print "|"
    print "• #{player_2.score} •".center(15)
    print "|"
    puts "•——————————————————————————————•"
  end

end
