def dealer_cards
  random3 = rand(@deck.deck.length)
  @dealer_card1 = @deck.deck[random3]
  @deck.deck.delete_at(random3)

  random4 = rand(@deck.deck.length)
  @dealer_card2 = @deck.deck[random4]
  @deck.deck.delete_at(random4)
end