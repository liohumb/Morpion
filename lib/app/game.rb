require 'bundler'
Bundler.require

$:.unshift File.expand_path('./../lib', __FILE__)

require 'views/board'
require 'app/player'
require 'views/boardcase'

class Game

	attr_accessor :num_round, :player_1, :player_2, :board_game_instance

	def initialize(first_player, second_player)
		@num_round = 0
		@player_1 = first_player
		@player_2 = second_player
		@board_game_instance = Board.new
	end

	def perform

		while @board_game_instance.game_finished? == false && @board_game_instance.there_is_a_winner == false    #boucle tant que les conditions de fin ne sont pas respectes
			if @num_round == 0    #Debut de la partie
				puts "#{player_1.name.upcase.blue} vs #{@player_2.name.upcase.red}".center(75)
        puts "—————————————————————————————————————————————————"
        puts "presse ENTRER pour commencer".center(50)
        puts "—————————————————————————————————————————————————"
        puts gets
      end

      @board_game_instance.board_to_show

			if @num_round%2==0 then
				puts "À #{@player_1.name.upcase.blue} de jouer".center(60)
				@board_game_instance.board_menu
				choosen_box = gets.chomp.to_i
				while @board_game_instance.check_player_move(choosen_box) == false
          if choosen_box.between?(1,9)
						puts "Ce coup est déjà joué, réessaye".yellow.center(50)
          else
						puts "Choisi un nombre entre 1 & 9".red.center(50)
        	end
					print "•    › ".green
					choosen_box = gets.chomp.to_i
	       end
				 @board_game_instance.game_move("X",choosen_box)
       else
				puts "À #{@player_2.name.upcase.red} de jouer".center(60)
	      @board_game_instance.board_menu
        choosen_box = gets.chomp.to_i
				while @board_game_instance.check_player_move(choosen_box) == false
          if choosen_box.between?(1,9)
						puts "Ce coup est déjà joué, réessaye".yellow.center(50)
	        else
						puts "Choisi un nombre entre 1 & 9".red.center(50)
          end
          print "•    › ".green
					choosen_box = gets.chomp.to_i
	      end

        @board_game_instance.game_move("O",choosen_box)

      end

      @num_round += 1

    end

    system("clear")

    if @board_game_instance.game_finished? == true
			 @board_game_instance.board_show_draw
		else
			 @board_game_instance.board_who_wins(@num_round, @player_1, @player_2)
		end

    @board_game_instance.show_result(@player_1, @player_2)

	end

end
