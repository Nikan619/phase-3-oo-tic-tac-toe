require 'pry'

class TicTacToe
    def initialize
        @board=[" "," "," "," "," "," "," "," "," "]
    end
    WIN_COMBINATIONS=[
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2],
    [0,3,6]]

    def display_board
       puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
       puts "-----------"
       puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
       puts "-----------"
       puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "

    end

       def input_to_index(num)
        num.to_i - 1;
       end
       def move(index,token="X")
        @board[index] =token
       end

       def position_taken?(index)
        @board[index]!=" "
       end

       def valid_move?(index)
       !position_taken?(index) && index.between?(0,8)
       end

       def turn_count
       @board.count{|x|  x!=" " }
       end

       def current_player
        if(turn_count.even?)
             "X"
        else
             "O"
        end
    end

    def turn
    puts "Please enter a new number"
    index = input_to_index(gets)
       if valid_move?(index)
         move(index,current_player)
         display_board
       else
        puts"invalid"
        turn
       end
      
    end

    def won?
      

    end
    def won?
      WIN_COMBINATIONS.any? do |combo|
          if position_taken?(combo[0]) && @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]]
              return combo
              
          end
       
      end
     
  end

    def full?
      @board.all?{|x|  x!=" " }
    end

def draw?
  full?&&!won?

end
def over?
  won?|| draw?

end

def winner
  if combo=won?
  @board[combo[0]]
  end
end

def play
  turn until over?
 puts winner ?  "Congratulations #{winner}!" :  "Cat's Game!"

end
end














# WIN_COMBINATIONS.find do |combo| 
# # index_1=combo[0]
# # index_2=combo[1]
# # index_3=combo[2]

# # @board[index_1] == @board[index_2] && @board[index_3] == @board[index_1]