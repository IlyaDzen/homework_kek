require_relative 'player_cards'
require_relative 'player_points'
require_relative 'dealer_cards'
require_relative 'dealer_points'
require_relative 'player'

def open_cards
  puts "Dealer cards: #{@dealer_card1}, #{@dealer_card2}, #{@dealer_card3}"
  puts "Dealer points #{@dealer_points}"

  if @player_points > 21 || @player_points < @dealer_points
    puts '---------YOU LOST---------'
    puts "Your balance: #{@player.balance}$"
  elsif @player_points == 21 || @player_points > @dealer_points
    puts '---------YOU WIN----------'
    @player.bet_win
    puts "Your balance: #{@player.balance}$"
  elsif @player_points == @dealer_points
    puts '-----------DRAW-----------'
    @player.draw
    puts "Your balance: #{@player.balance}$"
  end

  puts 
  puts 'Press 1 to play again'
  puts 'Press any key to exit'

  enter_index = gets.to_i
  if enter_index == 1
    new_game
  end
end