WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input) # code your input_to_index and move method here!
  input.to_i - 1
end

def move(board, index, character)
board[index]=character
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def valid_move?(board, index)
index.between?(0,8) && !position_taken?(board, index)
end

def turn(board)
  puts "Please enter 1-9:"
  input=gets.chomp
  index= input_to_index(input)
  if valid_move?(board, index)
  move(board, index, current_player(board))
  else
    turn(board)
  end
  display_board(board)
end

def turn_count(board)
  turns = 0
  board.each do |index|
    if index == "X" || index == "O"
    turns +=1
  end
end
turns
end

def current_player(board)
  if turn_count(board) % 2 == 0
    return "X"
  else
    return "O"
  end
end

def won?(board)
  WIN_COMBINATIONS.detect do |combo|
    board[combo[0]] == board[combo[1]] &&
    board[combo[1]] == board[combo[2]] &&
    position_taken?(board, combo[0])
  end
end

def full?(board)
  board.all? {|place| place == "X" || place == "O"}
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  board.all? {|x| won?(board) || full?(board) || draw?(board)}
end

def winner(board)
if winning_combo = won?(board)
    board[winning_combo.first]
end
end

def play(board)
  while !over?(board)
      turn(board)
    end
if won?(board)
puts "Congratulations #{winner(board)}!"
elsif draw?(board)
    puts "Cats Game!"
  end
end
