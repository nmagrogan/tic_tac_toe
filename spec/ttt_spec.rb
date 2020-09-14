require './lib/ttt.rb'

describe GameBoard do
  describe "#player_won?" do
    it 'Works when xs placed horizontally' do
      new_board = GameBoard.new
      new_board.board[0][0] = 'x'
      new_board.board[0][1] = 'x'
      new_board.board[0][2] = 'x'
      expect(new_board.player_won?).to eql(true)
    end

    it 'Works when os placed horizoatally' do
      new_board = GameBoard.new
      new_board.board[0][0] = 'o'
      new_board.board[0][1] = 'o'
      new_board.board[0][2] = 'o'
      expect(new_board.player_won?).to eql(true)
    end

    it 'Works when placed virtically' do
      new_board = GameBoard.new
      new_board.board[0][0] = 'o'
      new_board.board[1][0] = 'o'
      new_board.board[2][0] = 'o'
      expect(new_board.player_won?).to eql(true)
    end

    it 'Returns false when a player shouldnt have won(empty board)' do
      new_board = GameBoard.new
      expect(new_board.player_won?).to eql(false)
    end

    it 'Returns false when a player shouldnt have won(full line w/o a winner)' do
      new_board = GameBoard.new
      new_board.board[0][0] = 'x'
      new_board.board[1][0] = 'o'
      new_board.board[2][0] = 'o'
      expect(new_board.player_won?).to eql(false)
    end

    it 'works for diagonals)' do
      new_board = GameBoard.new
      new_board.board[0][0] = 'x'
      new_board.board[1][1] = 'x'
      new_board.board[2][2] = 'x'
      expect(new_board.player_won?).to eql(true)
    end
  end
end
