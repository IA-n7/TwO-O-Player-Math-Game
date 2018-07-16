require './player'

class Game

  attr_accessor :current_player, :current_answer, :player_1, :player_2

  def initialize(player1, player2)
    @current_player = player2
    @current_answer = 0
    @player_1 = player1
    @player_2 = player2
  end

  def random_number
    output = 1.times.map{ 1 + Random.rand(19) }
    output[0]
  end

  def new_turn
    if @current_player == player_1
      @current_player = player_2
    else
      @current_player = player_1
    end

    number1 = random_number
    number2 = random_number
    @current_answer = number1 + number2
    puts "-----NEW TURN-----"
    puts "#{@current_player.name}: What does #{number1} plus #{number2} equal?"
    player_answer = gets.chomp
    answer(player_answer)

    if player_1.lives == 0
      puts "#{player_2.name} wins with a score of #{player_2.lives}/3"
      puts "-----GAME OVER-----"
      puts "Good bye!"
    elsif player_2.lives == 0
      puts "#{player_1.name} wins with a score of #{player_1.lives}/3"
      puts "-----GAME OVER-----"
      puts "Good bye!"
    else
      new_turn
    end
  end

  def answer(answer)
    if answer != @current_answer.to_s
      puts "#{current_player.name} Seriously? No!"
      @current_player.lose_life
    end
    if answer == @current_answer.to_s
      puts "#{current_player.name} YES! You are correct."
    end
    puts "P1: #{player_1.lives}/3 vs P2 #{player_2.lives}/3"
  end

end
