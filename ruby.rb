# frozen_string_literal: true

# class pratice
class Player
  attr_accessor :name, :piece

  def initialize(player_number)
    @player_number = player_number
    player_name(@player_number)
    pick_peice
  end

  def player_name(player_number)
    puts "Player #{player_number} what is your name?"
    @name = gets.chomp
  end

  def pick_peice
    puts "#{@name} do you want X's or O's?"
    @piece = gets.chomp
  end
end

# class for game loop
class TikTacToe
  WINNING = [ [0,1,2],[3,4,5],[6,7,8], #Horizontal
    [0,3,6],[1,4,7],[2,5,8], #Vertical
    [0,4,8],[2,4,6]] #Diagonal

  def initialize
    @turn_count = 0
    @board = (1..9).to_a
    @p1 = Player.new(1)
    @p2 = Player.new(2)
    @game_over = false
    greetings
    play
  end

  def greetings
    puts "Hello #{@p1.name} and #{@p2.name}"
    puts "#{@p1.name} is #{@p1.piece}'s"
    puts "#{@p2.name} is #{@p2.piece}'s"
  end

  def display_board
    puts ""
    puts "#{@board[0]} | #{@board[1]} | #{@board[2]}"
    puts '--|---|---'
    puts "#{@board[3]} | #{@board[4]} | #{@board[5]}"
    puts '--|---|---'
    puts "#{@board[6]} | #{@board[7]} | #{@board[8]}"
  end

  def play
    player = @p1
    available_postions = (1..9).to_a
    turn_number = 0

    until @game_over
      display_board
      puts "#{player.name} choose a space."
      player_choice = gets.chomp.to_i
      until valid_move(player_choice, player, available_postions)
        p 'That is not a vaild move'
        p 'Please enter a vaild move'
        player_choice = gets.chomp.to_i
      end
      turn_number += 1
      player_move(player, player_choice, available_postions)
      if check_winner(available_postions, player)
        display_board
        puts "You won!"
        @game_over = true
      elsif
        check_stalemate(turn_number)
      end
      player == @p1 ? player = @p2 : player = @p1
    end
    puts 'game over'
  end

  def valid_move(player_choice, player, available_postions)
    available_postions.include?(player_choice)
  end

  def check_winner(available_postions, player)
    WINNING.any? do |combo|
      combo.all? { |number| available_postions[number] == player.piece }
    end
  end

  def check_stalemate(turn_number)
    @game_over = true if turn_number >= 9
    if @game_over
      display_board
      p 'The game is draw'
    end
  end

  def player_move(player, player_choice, available_postions)
    @board[player_choice - 1] = player.piece
    available_postions[player_choice - 1] = player.piece
  end
end

TikTacToe.new