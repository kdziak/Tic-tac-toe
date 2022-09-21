# frozen_string_literal: true

# class for the game.
class TikTacToe
  def initialize
    @turn_counter = 1
    @game_state = true
    puts 'Enter player 1 name.'
    @player_one = gets.chomp
    puts 'Enter Player 2 name.'
    @player_two = gets.chomp
    puts "Hello #{@player_one}, and #{@player_two}!"
    @board = (1..9).to_a
    display_board
    play_game
  end

  def display_board
    puts "#{@board[0]} | #{@board[1]} | #{@board[2]}"
    puts '--|---|---'
    puts "#{@board[3]} | #{@board[4]} | #{@board[5]}"
    puts '--|---|---'
    puts "#{@board[6]} | #{@board[7]} | #{@board[8]}"
  end

  def play_game
    while @turn_counter <= 9
      puts "#{@player_one} what square do you choose?"
      choice = gets.chomp.to_i
      @board[choice - 1] = 'X'
      display_board
      @turn_counter += 1
      if @turn_counter.even? && @turn_counter < 10
        puts "#{@player_two} what square do you choose?"
        choice = gets.chomp.to_i
        @board[choice - 1] = 'O'
        display_board
        @turn_counter += 1
      end
    end
  end

  def legal_move
    
  end
end

TikTacToe.new
