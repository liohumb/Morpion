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

  def new_players

    system("clear")
    welcome
    puts "Pour commencer, entre ton nom :"
    print " •  "

    player_1 = gets.chomp

    while player_1 == ""
      puts "Sois pas timide ! Dis moi ton petit nom :"
      print " •  "
      player_1 = gets.chomp
    end

    @player_1 = Player.new(player_1, "X")

    system("clear")

    puts "OK #{@player_1.name}, tu joues avec les 'X'"
    puts "Ensuite, entre le nom du deuxième joueur :"
    print " •  "

    player_2 = gets.chomp

    while player_2 == ""
      puts "Sois pas timide ! Dis moi son petit nom :"
      print " •  "
      player_2 = gets.chomp
    end

    @player_2 = Player.new(player_2, "O")

    system("clear")

    puts "OK #{@player_2.name}, tu joues avec les '0'"
    print "OK ? Appuie ENTRER quand tu es prêt(e)"
    gets

    system("clear")

  end

end
