require "pry"

class TicTacToe

WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
]


def initialize
    @board = [' ',' ',' ',' ',' ',' ',' ',' ',' ' ]
end

def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def input_to_index(str)
    str.to_i - 1
end

def move(index, char = "X")
    @board[index] = char
end

def position_taken?(index)
    @board[index] != " " 
end

def valid_move?(index)
    !position_taken?(index) && index.between?(0,8) 
end

def turn_count
    @board.count {|square| square !=" "}
    #still not exactly sure how we figured that one out...
end

def current_player
    if turn_count.even?
        "X"
        else "O"
    end
end

def turn
    puts "Please enter a new enumber"
    user_input = input_to_index(gets)
        if valid_move?(user_input)
            move(user_input, current_player)
            display_board
        else
            puts "invalid"
            turn
        end
end

def won?
    WIN_COMBINATIONS.any? do |combo|
        #binding.pry
        index_1 = combo[0]
        index_2 = combo[1]
        index_3 = combo[2]
        if (@board[index_1] == @board[index_2] && @board[index_2] == @board[index_3]) && position_taken?(index_1)

          return combo
        end
    end
end

def full?

end

def draw?

end

def over?

end

def winner
end


end