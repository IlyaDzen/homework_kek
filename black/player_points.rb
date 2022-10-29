def player_points
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
end