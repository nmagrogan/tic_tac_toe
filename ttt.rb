# frozen_string_literal: false

require 'pry'
# Game board class that will keep track of the game board
class GameBoard
  def initialize
    @board = [
      ['_', '_', '_'],
      ['_', '_', '_'],
      ['_', '_', '_']
    ]
  end

  def display_board
    @board.each { |row| p row }
  end

  def player_won?
    # checks if a player has won the game
    # checks if a line has been filled completly with one players marks
    # check rows
    # check columns
    # check diagonals
    # if a line is full of one symbol return true
    @board.each_with_index do |row, index|
      column = [@board[0][index], @board[1][index], @board[2][index]]

      unless row.include?('_') && column.include?('_')
        row_win = check_line(row)
        column_win = check_line(column)
        return true if column_win || row_win
      end
    end
    false
  end

  def check_line(line)
    if !line.include? 'x'
      true
    elsif !line.include? 'o'
      true
    else
      false
    end
  end

  def mark(player)
    # marks a place spot on the board
    good_placement = false
    until good_placement
      puts "#{player.symbol}: input x coordinate: "
      x_cord = gets.chop.to_i

      puts "#{player.symbol}: input y coordinate: "
      y_cord = gets.chomp.to_i

      @board[y_cord][x_cord] == '_' ? good_placement = true : puts('Spot already taken, try again.')
    end

    @board[y_cord][x_cord] = player.symbol
  end
end

# class for the player
class Player
  attr_reader :symbol
  def initialize(symbol)
    @symbol = symbol
  end
end

# class that runs the Game
class Game
  @@player1 = Player.new('x')
  @@player2 = Player.new('o')

  def self.player1
    @@player1.symbol
  end

  def self.player2
    @@player2.symbol
  end

  def initialize
    @board = GameBoard.new
    @gameover = false
    @turns = 0
  end

  def play
    # each player places a mark on the board
    turn(@@player1)
    until @gameover || @turns > 8
      break if turn(@@player2)
      break if turn(@@player1)
    end
  end

  def turn(player)
    @board.display_board
    @board.mark(player)
    if @board.player_won?
      puts "#{player.symbol} has won the game"
      return true
    end
    @turns += 1
    false
  end
end

my_game = Game.new
my_game.play
