@cards = [
  '2♠', '2♥', '2♧', '2♢', 
  '3♠', '3♥', '3♧', '3♢',
  '4♠', '4♥', '4♧', '4♢',
  '5♠', '5♥', '5♧', '5♢',
  '6♠', '6♥', '6♧', '6♢',
  '7♠', '7♥', '7♧', '7♢',
  '8♠', '8♥', '8♧', '8♢',
  '9♠', '9♥', '9♧', '9♢',
  '10♠', '10♥', '10♧', '10♢',
  'J♠', 'J♥', 'J♧', 'J♢',
  'Q♠', 'Q♥', 'Q♧', 'Q♢',
  'K♠', 'K♥', 'K♧', 'K♢',
  'A♠', 'A♥', 'A♧', 'A♢'
]


puts 'Tell me your name!'
name = gets.to_s
puts "Hello, #{name.chomp}, this is Black Jack game."
puts " "

puts "Your bank is 100$"
puts " "

puts 'Choose your option'
  puts '1 to start game'
  puts '2 to pass'
  puts '3 to add card'
  puts '4 to open cards'

def start
  random1 = rand(52)
  card1 = @cards[random1]
  @cards.delete_at(random1)

  random2 = rand(51)
  card2 = @cards[random2]
  @cards.delete_at(random2)
  

  puts "Your hand: #{card1}, #{card2}"
end





loop do
	enter_index = gets.to_i
	case enter_index
  when 1
    start
	when 2 
		pass
	when 3
    add_card
  when 4
    open_cards
  when 0
    break
  end
end
