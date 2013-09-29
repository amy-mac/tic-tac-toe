class Board
  
  attr_accessor :line1, :line2, :line3, :won
  
  def initialize
    @line1 = [1, 2, 3]
    @line2 = [4, 5, 6]
    @line3 = [7, 8, 9]
    @won = false
  end
  
  def display
    puts " #{@line1[0]} | #{@line1[1]} | #{@line1[2]}"
    puts "-----------"
    puts " #{@line2[0]} | #{@line2[1]} | #{@line2[2]}"
    puts "-----------"
    puts " #{@line3[0]} | #{@line3[1]} | #{@line3[2]}"
  end
  
  def winning
    if (@line1 || @line2 || @line3) == (['❌', '❌', '❌'] || ['⭕', '⭕', '⭕'])
      puts "You won!"
      @won = true
    end
    if (@line1[0] == '❌') && (@line2[0] == '❌') && (@line3[0] == '❌')
      puts 'You won!'
      @won = true
    end
    if (@line1[0] == '⭕') && (@line2[0] == '⭕') && (@line3[0] == '⭕')
      puts 'You won!'
      @won = true
    end
    if (@line1[1] == '❌') && (@line2[1] == '❌') && (@line3[1] == '❌') 
      puts 'You won!'
      @won = true
    end
    if (@line1[1] == '⭕') && (@line2[1] == '⭕') && (@line3[1] == '⭕')
      puts 'You won!'
      @won = true
    end
    if (@line1[2] == '❌') && (@line2[2] == '❌') && (@line3[2] == '❌')
      puts 'You won!'
      @won = true
    end
    if (@line1[2] == '⭕') && (@line2[2] == '⭕') && (@line3[2] == '⭕')
      puts 'You won!'
      @won = true
    end
    if (@line1[0] == '❌') && (@line2[1] == '❌') && (@line3[2] == '❌') 
      puts 'You won!'
      @won = true
    end
    if (@line1[0] == '⭕') && (@line2[1] == '⭕') && (@line3[2] == '⭕')
      puts 'You won!'
      @won = true
    end
    if (@line1[2] == '❌') && (@line2[1] == '❌') && (@line3[0] == '❌') 
      puts 'You won!'
      @won = true
    end
    if (@line1[2] == '⭕') && (@line2[1] == '⭕') && (@line3[0] == '⭕')
      puts 'You won!'
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
    @player1_sign = "❌"
    @player2_sign = "⭕"
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
    if turn.even?
      current_player_sign = players.player1_sign
      current_player_name = players.player1
    else
      current_player_sign = players.player2_sign
      current_player_name = players.player2
    end
    
    puts "#{current_player_name} select your number"
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
      Process.exit(0)
    else
      play_game.winning
    end
  end
    
end

intro