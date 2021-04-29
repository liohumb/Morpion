require 'bundler'
Bundler.require
$:.unshift File.expand_path('./../lib' __FILE__)
require 'app/player'
require 'view/board'
require 'app/game'
require 'view/boardcase'

class Application

  attr_accessor :player_1, :player_2, :next_party

  def initialize
    new_players
    @next_party = "y"
  end

  def perform

    while @next_party == "y"
      Game.new(@player_1, @player_2).perform
      puts "On continue ? y/n".yellow
      print " •  "
      @next_party = gets.chomp
      while @next_party!= "y" && @next_party!= "n"
        puts "Hm.. Je n'ai pas compris ?!?! On continue ? y/n".red
        print " •  "
        @next_party = gets.chomp
      end
    end

    puts "Merci ! J'espère que ça t'a plu ??"

  end

end
