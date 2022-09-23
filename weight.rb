puts "Hello what is your name?"
name = gets.chomp

puts "what is your height?"
height = gets.chomp

weight = ((height.to_i-110)*1.15)

if weight >= 0
puts "#{name},Your ideal weight is #{(height.to_i-110)*1.15}"
else puts "Your weight is optimal)"
	end