require 'bundler'
Bundler.require
$:.unshift File.expand_path('./../lib', __FILE__)
require 'view/board'
require 'app/player'
require 'view/boardcase'

class Game

  attr_accessor :num_round, :player_1, :player_2, :board_game_instance

  def initialize(first_player, second_player)
    @num_round = 0
    @player_1 = first_player
    @player_2 = second_player
    @board_game_instance = Board.new
  end

  def perform

    while @board_game_instance.game_finished? == false && @board_game_instance.there—is—a—winner == false
      if @num_round == 0
        puts "• Appuie sur ENTRER pour commencer •"
        puts gets
      end

      @board_game_instance.board_to_show

      if @num_round%2==0 then
        puts "C'est à #{@player_1.name} de jouer"
        @board_game_instance.board_menu
        choosen_box = gets.chomp.to_i
        while @board_game_instance.check_player_move(choosen_box) == false
          if choosen_box.between?(1,9)
            puts "Tu ne peux pas jouer cette case, elle a déjà etait joué.. Choisis en une autre".yellow
          else
            puts "Hm.. Je te rappelle que tu dois jouer en choisissant un nombre entre 1 et 9".red
          end
          print " •  "
          choosen_box = gets.chomp.to_i
        end
        @board_game_instance.game_move("X", choosen_box)
      else
        puts "C'est à #{@player_2.name} de jouer"
        @board_game_instance.board_menu
        choosen_box = gets.chomp.to_i
        while @board_game_instance.check_player_move(choosen_box) == false
          if choosen_box.between?(1,9)
            puts "Tu ne peux pas jouer cette case, elle a déjà etait joué.. Choisis en une autre".yellow
          else
            puts "Hm.. Je te rappelle que tu dois jouer en choisissant un nombre entre 1 et 9".red
          end
          print " •  "
          choosen_box = gets.chomp.to_i
        end
        @board_game_instance.game_move("O", choosen_box)
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

  def show_result

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
