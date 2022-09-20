# frozen_string_literal: true

# class for the game.
class TikTacToe
  def initialize
    puts 'Enter player 1 name.'
    @player_one = gets.chomp
    puts 'Enter Player 2 name.'
    @player_two = gets.chomp
    puts "Hello #{@player_one}, and #{@player_two}!"
    @board = Array.new(3) { Array.new(3, :e) }
    display_board
    play_game
  end

  def display_board
    puts "#{@board[0][0]=1} | #{@board[0][1]=2} | #{@board[0][2]=3}"
    puts '--|---|---'
    puts "#{@board[1][0]=4} | #{@board[1][1]=5} | #{@board[1][2]=6}"
    puts '--|---|---'
    puts "#{@board[2][0]=7} | #{@board[2][1]=8} | #{@board[2][2]=9}"
  end

  def play_game
    puts "#{@player_one} what square do you choose?"
  end
end

TikTacToe.new
