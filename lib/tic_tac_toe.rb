require 'pry'
class TicTacToe

    def initialize(board = nil)
        @board = Array.new(9, " ")
    end

    WIN_COMBINATIONS = [
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8],
        [0, 3, 6],
        [1, 4, 7],
        [2, 5, 8],
        [0, 4, 8],
        [6, 4, 2]
    ]

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(input)
        input.to_i - 1
    end

    def move(move, player)
        @board[move] = player
    end

    def position_taken?(input_to_index)
        @board[input_to_index] != " " && @board[input_to_index] != ""
    end

    def valid_move?(move)
        move.between?(0,8) && !position_taken?(move)
    end

    def turn_count
        @board.count &["X","O"].method(:include?)
    end

    def current_player
        self.turn_count % 2 == 0 ? "X" : "O"
    end

    def turn
        puts "Input your move num between 1-8"
        input = gets.chomp
        move = input_to_index(input)
        if valid_move?(move)
            move(move,current_player)
            display_board
        else
            turn
        end
    end

    def won?
        WIN_COMBINATIONS.each do |win_combination|
          win_index_1 = win_combination[0]
          win_index_2 = win_combination[1]
          win_index_3 = win_combination[2]
      
          position_1 = @board[win_index_1]
          position_2 = @board[win_index_2]
          position_3 = @board[win_index_3]
      
          if position_1 == "X" && position_2 == "X" && position_3 == "X"
            return win_combination
          elsif
          position_1 == "O" && position_2 == "O" && position_3 == "O"
            return win_combination
          end
        end
        return false
      end
      
      def full?
        if turn_count == 9 && !won?
            true
        end
      end

      def draw?
        full?
      end

      def over?
        if draw?
            true
        elsif won?
            true
        else 
            false
        end
      end

      def winner
        if won?
            @board[won?[0]]
        end
    end

    def play
        turn until over?
        if won?
            puts "Congratulations #{winner}!"
        elsif draw?
            puts "Cat's Game!"
        end
    end




end 