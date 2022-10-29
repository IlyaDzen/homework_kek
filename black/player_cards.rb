def player_cards
  random1 = rand(@deck.deck.length)
  @player_card1 = @deck.deck[random1]
  @deck.deck.delete_at(random1)

  random2 = rand(@deck.deck.length)
  @player_card2 = @deck.deck[random2]
  @deck.deck.delete_at(random2)
end