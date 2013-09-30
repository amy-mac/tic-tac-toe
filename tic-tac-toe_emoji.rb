class IllegalMove < StandardError
  def message
    "That is an invalid move."
  end
end

class Board
  
  attr_accessor :line1, :line2, :line3
  attr_reader :won
  
  def initialize
    @line1 = [1, 2, 3]
    @line2 = [4, 5, 6]
    @line3 = [7, 8, 9]
    @won = false
  end
  
  def display
    line_width = 60
    puts "  #{@line1[0]} | #{@line1[1]} | #{@line1[2]}  ".center(line_width)
    puts "-------------".center(line_width)
    puts "  #{@line2[0]} | #{@line2[1]} | #{@line2[2]}  ".center(line_width)
    puts "-------------".center(line_width)
    puts "  #{@line3[0]} | #{@line3[1]} | #{@line3[2]}  ".center(line_width)
  end
  
  def winning
    if (@line1 == ['❌', '❌', '❌']) || (@line1 == ['⭕', '⭕', '⭕'])
      @won = true
    end
    if (@line2 == ['❌', '❌', '❌']) || (@line2 == ['⭕', '⭕', '⭕'])
      @won = true
    end
    if (@line3 == ['❌', '❌', '❌']) || (@line3 == ['⭕', '⭕', '⭕'])
      @won = true
    end
    if (@line1[0] == '❌') && (@line2[0] == '❌') && (@line3[0] == '❌')
      @won = true
    end
    if (@line1[0] == '⭕') && (@line2[0] == '⭕') && (@line3[0] == '⭕')
      @won = true
    end
    if (@line1[1] == '❌') && (@line2[1] == '❌') && (@line3[1] == '❌') 
      @won = true
    end
    if (@line1[1] == '⭕') && (@line2[1] == '⭕') && (@line3[1] == '⭕')
      @won = true
    end
    if (@line1[2] == '❌') && (@line2[2] == '❌') && (@line3[2] == '❌')
      @won = true
    end
    if (@line1[2] == '⭕') && (@line2[2] == '⭕') && (@line3[2] == '⭕')
      @won = true
    end
    if (@line1[0] == '❌') && (@line2[1] == '❌') && (@line3[2] == '❌') 
      @won = true
    end
    if (@line1[0] == '⭕') && (@line2[1] == '⭕') && (@line3[2] == '⭕')
      @won = true
    end
    if (@line1[2] == '❌') && (@line2[1] == '❌') && (@line3[0] == '❌') 
      @won = true
    end
    if (@line1[2] == '⭕') && (@line2[1] == '⭕') && (@line3[0] == '⭕')
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
  puts ''
  puts "What's Player 2's name?"
  player2 = gets.chomp
  puts ''
  puts "Here is your game board:"
  puts ''
  
  if player1.empty?
    player1 = 'Player 1'
  elsif player2.empty?
    player2 = 'Player 2'
  end
  
  players = Players.new(player1, player2)
  play_game = Board.new
  turn = 0
  
  while play_game.won == false
    puts `clear`
    play_game.display
    puts ''
    
    if turn.even?
      current_player_sign = players.player1_sign
      current_player_name = players.player1
    
    else
      current_player_sign = players.player2_sign
      current_player_name = players.player2
    end
    
    begin
      puts "#{current_player_name}, select your space:"
      answer = gets.chomp.to_i
    
      unless answer.zero?
  
        case answer
        when 1
          if play_game.line1[0].is_a? Integer
            play_game.line1[0] = current_player_sign
          else
            raise IllegalMove
          end
        when 2
          if play_game.line1[1].is_a? Integer
            play_game.line1[1] = current_player_sign 
          else
            raise IllegalMove
          end
        when 3
          if play_game.line1[2].is_a? Integer
            play_game.line1[2] = current_player_sign
          else
            raise IllegalMove
          end
        when 4
          if play_game.line2[0].is_a? Integer
            play_game.line2[0] = current_player_sign
          else
            raise IllegalMove
          end
        when 5
          if play_game.line2[1].is_a? Integer
            play_game.line2[1] = current_player_sign
          else
            raise IllegalMove
          end
        when 6
          if play_game.line2[2].is_a? Integer
            play_game.line2[2] = current_player_sign
          else
            raise IllegalMove
          end
        when 7
          if play_game.line3[0].is_a? Integer
            play_game.line3[0] = current_player_sign
          else
            raise IllegalMove
          end
        when 8
          if play_game.line3[1].is_a? Integer
            play_game.line3[1] = current_player_sign
          else
            raise IllegalMove
          end
        when 9
          if play_game.line3[2].is_a? Integer
            play_game.line3[2] = current_player_sign
          else
            raise IllegalMove
          end
        end
      else
        raise IllegalMove
      end
    
    rescue IllegalMove => e
      puts e.message
      retry
    end
    
    turn += 1
    
    if turn == 9
      puts "It's a tie!"
      play_game.display
      puts "'The only winning move is not to play.' -War Games"
      Process.exit(0)
    
    else
      play_game.winning
      if play_game.won == true
        puts "Congratulations #{current_player_name}, you won! 🏆"
        puts ''
        play_game.display
        puts ''
      end
    end
  
  end
    
end

intro