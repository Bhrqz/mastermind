

class String
  # colorization
  def colorize(color_code)
    "\e[#{color_code}m#{self}\e[0m"
  end

  #Result Colors
  def black ;   colorize(40)  end
  def reverse_color ; "\e[7m#{self}\e[27m"  end
  def gray ; colorize (47) end

  #Game Colors
  def red  ;   colorize(41)  end
  def green   ;  colorize(42)  end
  def brown ;   colorize(43)  end
  def blue  ;  colorize(44)  end
  def pink  ;  colorize(45)  end
  def cyan  ;  colorize(46)  end
  
end

def newPlayerBoard
  player_board = [1,2,3,4]
end

def welcomeGuesser (player_board)
  puts "Welcome to MasterMind, guesser\nComputer already made the code\nAre you ready to break it?"
  puts "These are your colors"
  print " red  ".red 
  print "green ".green
  print "brown ".brown
  print " blue ".blue
  print " pink ".pink
  puts " cyan ".cyan
  puts "and this is your board"
  print player_board
  askPlays("1", player_board)
end

# the player makes his/her move
def askPlays (playNum, board)
  player = []
  position = playNum.to_i

  4.times do 
    current_color = ""
    puts "\nIn position number #{position} \nwhat color do you want to use?"
    
    current_color = STDIN.gets.chomp
    #binding.pry
    case current_color

    when 'red'
      board[position-1] = " red  ".red
      position += 1
      player.push(1)
      puts board
    when 'green'
      board[position-1] = "green ".green
      position += 1
      player.push(2)
      puts board
    when 'brown'
      board[position-1] = "brown ".brown
      position += 1
      player.push(3)
      puts board
    when 'blue'
      board[position-1] = " blue ".blue
      position += 1
      player.push(4)
      puts board
    when 'pink'
      board[position-1] = " pink ".pink
      position += 1
      player.push(5)
      puts board
    when 'cyan'
      board[position-1] = " cyan ".cyan
      position += 1
      player.push(6)
      puts board
    else
      puts "What? I did not catch that. We'll use green, my favorite one\nTry to write this colors exactly as you see them above\nI'm still a machine, y'know"
      board[position-1] = "green ".green
      puts board
      position +=1
      player.push(2)
    end
  end

  puts "So..."

  board.each do |p|
    if p == "\e[42mgreen \e[0m"
      print "green".green
    elsif p == "\e[41m red  \e[0m"
      print  " red ".red
    elsif p == "\e[43mbrown \e[0m"
      print "brown".brown
    elsif p == "\e[44m blue \e[0m"
      print  " blue ".blue
    elsif p == "\e[45m pink \e[0m"
      print  " pink ".pink
    elsif p == "\e[46m cyan \e[0m"
      print  " cyan ".cyan
    end
    
  end
  comparing(player, playNum, board)
end


def computerPlays ()

  array = Array.new(4) { rand(1..6) }
  return array
end

$win = 0
$count = 0
$safe = 1
def comparing(player, playNum, board)
  print "...this is your guess\nand this is the result:"
    
    if $safe == 1
      com1 = computerPlays()
    end
    $safe += 1

    unless com1 == nil
    $com = com1 
    end 

   



  player.each_with_index do |p, i| 
    if $com[i] == p 
      print "black ".black
      $win += 1
        if $win == 4
          puts "YOU CRACKED THE CODE!!!"
          exit
        end 

      
    elsif $com.include? p 
      print "white ".reverse_color
      $win = 0
    else 
      print " gray ".gray
      $win = 0
      
    end

  end
  $count += 1
  if $count < 12
    puts "Let's try again, #{12-$count} chances remaining"
    askPlays(playNum, board)
  else 
    puts "Ran out of chances. Game Over"
    
    exit
  end

end


welcomeGuesser(newPlayerBoard)

  

