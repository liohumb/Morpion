require 'bundler'
Bundler.require

$:.unshift File.expand_path('./../lib', __FILE__)

require 'app/player'
require 'views/board'
require 'app/game'
require 'views/boardcase'

class Application

  attr_accessor :player_1, :player_2, :next_party

	def initialize
		new_players
		@next_party ="y"
	end

	def perform

    while @next_party == "y"
			Game.new(@player_1,@player_2).perform
        puts ""
			  puts "On rejoue ?  y / n ".center(50)
        puts ""
        print "•    › ".green
        @next_party = gets.chomp

    while @next_party!= "y" && @next_party!= "n"
				puts "Oups.. Est ce que tu veux rejouer ?".center(50)
        puts "Appuie sur 'y' pour oui ou sur 'n' pour non".center(50)
	      print "•    › ".green
				@next_party = gets.chomp
      end

    end

    puts ""
    puts "Merci ! A bientôt :)".green.center(50)
    puts ""

  end

	def new_players

    system("clear")

    welcome
      puts ""
      puts "Quel est ton nom?".center(50)
      puts ""
      print "•    › ".green
      player1 = gets.chomp

    while player1==""
			puts "Il me faut un nom, réessaye :".red.center(50)
      puts ""
			print "•    › ".green
			player1 = gets.chomp
		end

    @player_1 = Player.new(player1, "X")

    system ("clear")

    puts "Bonjour #{@player_1.name.upcase.blue}, tu vas jouer avec les 'X'".center(50)
    puts ""
    puts "Quel est le nom de ton adversaire ?".center(50)
    puts ""
    print "•    › ".green
    player2 = gets.chomp

    while player2==""
    puts "Il me faut un nom, réessaye :".red.center(50)
    puts ""
    print "•    › ".green
    player2 = gets.chomp

    end

		@player_2 = Player.new(player2, "O")

    system( "clear")

  end

	def welcome
		puts ""
    puts "—————————————————————————————————————————————————".green
    puts "|||||||||||||||||||||||||||||||||||||||||||||||||".green
    puts "|||||||||||||||||||  LE  JEU  |||||||||||||||||||".green
    puts "|||||||||||||||||||    DU     |||||||||||||||||||".green
    puts "|||||||||||||||||||  MORPION  |||||||||||||||||||".green
    puts "|||||||||||||||||||||||||||||||||||||||||||||||||".green
    puts "—————————————————————————————————————————————————".green
  end

end
