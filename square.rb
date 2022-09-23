puts "first side"
a=gets.chomp

puts "second side"
b=gets.chomp

puts "third side"
c=gets.chomp

if a.to_i == b.to_i and c.to_i == a.to_i
	 puts "triange is equal"
	else
		if a.to_i == b.to_i or a.to_i == c.to_i or b.to_i == c.to_i
			puts "triange is isosceles"
		else
			if a.to_i > b.to_i and a.to_i > c.to_i  and (a.to_i)*(a.to_i)==(b.to_i)*(b.to_i)+(c.to_i)*(c.to_i)				
			puts "rectangular"	
		end
	end
end