def dealer_points
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
end

