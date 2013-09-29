class OccupiedError < StandardError
  def message
    "That space has already been played."
  end
end

class Board
  
  attr_accessor :line1, :line2, :line3, :won
  
  def initialize
    @line1 = [1, 2, 3]
    @line2 = [4, 5, 6]
    @line3 = [7, 8, 9]
    @won = false
  end
  
  def display
    line_width = 60
    puts "  #{@line1[0]} | #{@line1[1]} | #{@line1[2]}  ".center(60)
    puts "-------------".center(60)
    puts "  #{@line2[0]} | #{@line2[1]} | #{@line2[2]}  ".center(60)
    puts "-------------".center(60)
    puts "  #{@line3[0]} | #{@line3[1]} | #{@line3[2]}  ".center(60)
  end
  
  def winning
    if (@line1 || @line2 || @line3) == (['X', 'X', 'X'] || ['O', 'O', 'O'])
      @won = true
    end
    if (@line1[0] == 'X') && (@line2[0] == 'X') && (@line3[0] == 'X')
      @won = true
    end
    if (@line1[0] == 'O') && (@line2[0] == 'O') && (@line3[0] == 'O')
      @won = true
    end
    if (@line1[1] == 'X') && (@line2[1] == 'X') && (@line3[1] == 'X') 
      @won = true
    end
    if (@line1[1] == 'O') && (@line2[1] == 'O') && (@line3[1] == 'O')
      @won = true
    end
    if (@line1[2] == 'X') && (@line2[2] == 'X') && (@line3[2] == 'X')
      @won = true
    end
    if (@line1[2] == 'O') && (@line2[2] == 'O') && (@line3[2] == 'O')
      @won = true
    end
    if (@line1[0] == 'X') && (@line2[1] == 'X') && (@line3[2] == 'X') 
      @won = true
    end
    if (@line1[0] == 'O') && (@line2[1] == 'O') && (@line3[2] == 'O')
      @won = true
    end
    if (@line1[2] == 'X') && (@line2[1] == 'X') && (@line3[0] == 'X') 
      @won = true
    end
    if (@line1[2] == 'O') && (@line2[1] == 'O') && (@line3[0] == 'O')
      @won = true
    end
  end

end

class Players
  attr_accessor :player1, :player2
  attr_reader :player1_sign, :player2_sign
  
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @player1_sign = "X"
    @player2_sign = "O"
  end
end


def intro
  puts 'Welcome to Tic-Tac-Toe'
  puts ''
  new_game
end

def new_game
  puts "What's Player 1's name?"
  player1 = gets.chomp
  puts "What's Player 2's name?"
  player2 = gets.chomp
  puts "Here is your game board:"
  puts ''
  
  players = Players.new(player1, player2)
  play_game = Board.new
  turn = 0
  
  while play_game.won == false
    play_game.display
    puts ''
    
    if turn.even?
      current_player_sign = players.player1_sign
      current_player_name = players.player1
    
    else
      current_player_sign = players.player2_sign
      current_player_name = players.player2
    end
    
    puts "#{current_player_name}, select your space:"
    answer = gets.chomp.to_i
  
    case answer
    when 1
      play_game.line1[0] = current_player_sign
    when 2
      play_game.line1[1] = current_player_sign
    when 3
      play_game.line1[2] = current_player_sign
    when 4
      play_game.line2[0] = current_player_sign
    when 5
      play_game.line2[1] = current_player_sign
    when 6
      play_game.line2[2] = current_player_sign
    when 7
      play_game.line3[0] = current_player_sign
    when 8
      play_game.line3[1] = current_player_sign
    when 9
      play_game.line3[2] = current_player_sign
    end
    
    turn += 1
    
    if turn == 9
      puts "It's a tie!"
      play_game.display
      puts "'The only winning move is not to play at all.' -War Games"
      Process.exit(0)
    
    else
      play_game.winning
      if play_game.won == true
        puts "Congratulations #{current_player_name}, you won!"
        puts ''
        play_game.display
      end
    end
  
  end
    
end

intro