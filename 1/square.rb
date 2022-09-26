puts "first side"
a = gets.chomp.to_i

puts "second side"
b = gets.chomp.to_i

puts "third side"
c = gets.chomp.to_i

if a == b and c == a
  puts "triange is equal"
elsif a == b or a == c or b == c
  puts "triange is isosceles"
elsif a * a == b * b + c * c or b * b == a * a + c * c or c * c == a * a + b * b
  puts "rectangular"
end