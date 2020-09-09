# frozen_string_literal: false

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

  def mark(player)
    # marks a place spot on the board
    puts "#{player.symbol}: input x coordinate: "
    x_cord = gets.chop.to_i

    puts "#{player.symbol}: input y coordinate: "
    y_cord = gets.chomp.to_i

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
  end

  def turn
    # each player places a mark on the board
    until @gameover
      @board.display_board
      @board.mark(@@player1)
      #@gameover = @board.check
      @board.display_board
      @board.mark(@@player2)
      #@gameover = @board.check
    end
  end
end

my_game = Game.new
my_game.turn
