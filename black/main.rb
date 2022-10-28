require_relative 'deck'
require_relative 'player'
require_relative 'points'

puts 'Your balance is 100$, choose your name to start game!'
name = gets.to_s
puts "Hello, #{name.chomp}."

@pl = Player.new

def new_game
  @d = Deck.new
  @d.deck_create
  @pl.bet_take
  puts "Your balance is #{@pl.balance}$"

  # PLAYER CARDS

  random1 = rand(@d.deck.length)
  @player_card1 = @d.deck[random1]
  @d.deck.delete_at(random1)

  random2 = rand(@d.deck.length)
  @player_card2 = @d.deck[random2]
  @d.deck.delete_at(random2)

  # PLAYER POINTS

  points_card1 = Points.new(@player_card1)
  points_card1.score_high

  points_card2 = Points.new(@player_card2)
  if @player_card1[0] != 'A'
    points_card2.score_high
  else 
    points_card2.score_low
  end

  @player_points = points_card1.points + points_card2.points
  puts
  puts "Your cards: #{@player_card1}, #{@player_card2}"
  
  puts "Your points is #{@player_points}"
  puts

  @player_points = points_card1.points + points_card2.points

  # DEALER CARDS

  random3 = rand(@d.deck.length)
  @dealer_card1 = @d.deck[random3]
  @d.deck.delete_at(random3)

  random4 = rand(@d.deck.length)
  @dealer_card2 = @d.deck[random4]
  @d.deck.delete_at(random4)

  # DEALER POINTS

  points_d_card1 = Points.new(@dealer_card1)
  points_d_card1.score_high

  points_d_card2 = Points.new(@dealer_card2)
  if @dealer_card1[0] != 'A'
    points_d_card2.score_high
  else 
    points_d_card2.score_low
  end

  @dealer_points = points_d_card1.points + points_d_card2.points

  puts "Dealer cards: * *"
  puts

  puts 'Choose your option'
  puts '1 to pass'
  puts '2 to add card'
  puts '3 to open cards'
  puts '4 to start new game'
end

new_game

def add_card
  random = rand(@d.deck.length)
  @player_card3 = @d.deck[random]
  @d.deck.delete_at(random)

  puts
  puts "Your added card: #{@player_card3}"

  points_card3 = Points.new(@player_card3)
  if @player_points < 11
    points_card3.score_high
  else 
    points_card3.score_low
  end

  @player_points += points_card3.points

  puts "Your points is #{@player_points}"
end

def pass
  if @dealer_points < 17
    random = rand(@d.deck.length)
    @dealer_card3 = @d.deck[random]
    @d.deck.delete_at(random)
    puts "Dealer cards: * * *"

    points_card3 = Points.new(@dealer_card3)
    if @dealer_points < 11
      points_card3.score_high
    else 
      points_card3.score_low
    end
     @dealer_points += points_card3.points
  else 
    puts "Dealer cards: * *"
  end
end

def open_cards
  puts "Dealer cards: #{@dealer_card1}, #{@dealer_card2}, #{@dealer_card3}"
  puts @dealer_points

  if @player_points > 21
    puts 'You lost'
    puts "Your balance: #{@pl.balance}$"
  elsif @player_points == 21 and @dealer_points !=21
    puts 'You win'
    @pl.bet_win
    puts "Your balance: #{@pl.balance}$"
  elsif @player_points > @dealer_points
    puts 'You win'
    @pl.bet_win
    puts "Your balance: #{@pl.balance}$"
  elsif @player_points == @dealer_points
    puts 'Draw'
    @pl.draw
    puts "Your balance: #{@pl.balance}$"
  elsif @player_points < @dealer_points
    puts 'You lost'
    puts "Your balance: #{@pl.balance}$"
  end

end
  
loop do
	enter_index = gets.to_i
	case enter_index
  when 1
    pass
	when 2
		add_card
	when 3
    open_cards
  when 4
    new_game
  when 0
    break
  end
end
