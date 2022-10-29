require_relative 'deck'
require_relative 'player'
require_relative 'points'
require_relative 'player_cards'
require_relative 'player_points'
require_relative 'dealer_cards'
require_relative 'dealer_points'
require_relative 'open_cards'

puts 'Your balance is 100$, choose your name to start game!'
name = gets.to_s
puts "Hello, #{name.chomp}."

@player = Player.new

def new_game
  @deck = Deck.new
  @deck.deck_create
  @player.bet_take
  puts "Your balance is #{@player.balance}$"
  player_cards
  player_points
  dealer_cards
  dealer_points

  puts 'Press 1 to pass'
  puts 'Press 2 to add card'

  enter_index = gets.to_i
  if enter_index == 1
    pass
  elsif enter_index == 2
   add_card
  end
end

def add_card
  random = rand(@deck.deck.length)
  @player_card3 = @deck.deck[random]
  @deck.deck.delete_at(random)
  puts "Your cards: #{@player_card1}, #{@player_card2}, #{@player_card3}"
  points_card3 = Points.new(@player_card3)
  if @player_points < 11
    points_card3.score_high
  else 
    points_card3.score_low
  end
  @player_points += points_card3.points
  puts "Your points is #{@player_points}"
  pass
end

def pass
  if @dealer_points < 17
    random = rand(@deck.deck.length)
    @dealer_card3 = @deck.deck[random]
    @deck.deck.delete_at(random)
    points_card3 = Points.new(@dealer_card3)

    points_card3.score_low if @dealer_points >= 11
    points_card3.score_high if @dealer_points < 11
    @dealer_points += points_card3.points
    open_cards
  else
    @dealer_card3 = ' '
    open_cards
  end
end

new_game



