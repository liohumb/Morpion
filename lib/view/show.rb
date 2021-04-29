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

  def live_board

    system("clear")

    puts "—" * 49

    3.times do |line|

      new_line = []

      if line == 0
        new_line << @board_case_array[0].box_value
        new_line << @board_case_array[1].box_value
        new_line << @board_case_array[2].box_value
      elsif line == 1
        new_line << @board_case_array[3].box_value
        new_line << @board_case_array[4].box_value
        new_line << @board_case_array[5].box_value
      else
        new_line << @board_case_array[6].box_value
        new_line << @board_case_array[7].box_value
        new_line << @board_case_array[8].box_value
      end

      new_line.each do |letter|

        print "|"

        if letter == "0"
          print ("##").center (15)
        elsif letter == "X"
          print ("#" + " "*(9) + "#").center(15)
        else
          print (" ").center(15)
        end

      end

      if line == 0
        print "|"
        puts "/\\".center(12)
      elsif line == 1
        print "|"
        puts "| _ \\".center(12)
      else
        print "|"
        puts "./ ___|".center(12)
      end

      space_circle = 4
      space_cross = 7

      1.upto(2).each do |y|

        new_line.each do |letter|

          print "|"

          if letter == "0"
            print ("#" + " "*(space_circle) + "#").center(15)
          elsif letter == "X"
            print ("#" + " "*(space_cross) + "#").center(15)
          else
            print (" ").center(15)
          end

        end

        y<2? space_circle += 2 : space_circle
        space_cross -= 4

        if line == 0
          if y == 1
            print "|"
            puts ": \\".center(12)
          else
            print "|"
            puts "/ /\\ \\".center(12)
          end
        elsif line == 1
          if y == 1
            print "|"
            puts " | |_) |".center
          else
            print "|"
            puts " |  _ <".center(12)
          end
        else
          if y == 1
            print "|"
            puts "| |   ".center(12)
          else
            print "|"
            puts "| |   ".center(12)
          end
        end

      end

      1.upto(2).each do |y|

        space_cross +=4

        new_line.each do |letter|

          print "|"

          if letter == "O"
            print ("#" + " "*(space_circle) + "#").center(15)
          elsif letter == "X"
            print ("#" + " "*(space_cross) + "#").center(15)
          else
            print (" ").center(15)

          end

        end

        space_circle -= 2

        if line == 0
          if y == 1
            print "|"
            puts "/ ___ \\_\\".center(12)
          end
        elsif line == 1
          if y == 1
            print "|"
            puts "| |_) |".center(12)
          else
            print "|"
            puts "|___/".center(12)
          end
        else
          if y == 1
            print "|"
            puts " | |___".center(12)
          else
            print "|"
            puts "  .\\____|".center(12)
          end
        end

      end

      new_line.each do |letter|

        print "|"

        if letter == "O"
          print ("##").center(15)
        elsif letter == "X"
          print ("#" + " "*(9) + "#").center(15)
        else
          print (" ").center(15)
        end

      end

      puts "|"

      if line == 0
        print "—" * 49
        puts "___".center(12)
      elsif line == 1
        print "—" * 49
        puts "____".rjust(10)
      else
        puts "—" * 49
      end

    end

    puts (" __"+" "*13+" ___"+" "*14+" ____").center(50)
		puts ("/_ |"+" "*13+"|__ \\"+" "*13+"|___ \\").center(50)
		puts (" | |"+" "*16+") |"+" "*13+"__) |").center(50)
		puts (" | |"+" "*16+"/ /"+" "*13+"|__ <").center(50)
		puts (" | |"+" "*15+"/ /_"+" "*13+"___) |").center(50)
		puts (" |_|"+" "*14+"|____|"+" "*11+"|____/").center(50)
		puts ""

  end

end
