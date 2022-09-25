puts "first side"
a = gets.chomp.to_i

puts "second side"
b = gets.chomp.to_i

puts "third side"
c = gets.chomp.to_i

if a == b and c == a
	 puts "triange is equal"
else
	if a == b or a == c or b == c
		puts "triange is isosceles"
	elsif a > b and a > c  and a * a == b * b + c * c
	elsif b > a and b. > c and b * b == a * a + c * c
	elsif c > b and c > a  and c * c == b * b + a * a
		puts "rectangular"	
	end
end