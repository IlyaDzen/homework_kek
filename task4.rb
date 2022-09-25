puts "first index"
a = gets.chomp.to_i

puts "second index"
b = gets.chomp.to_i

puts "third index"
c = gets.chomp.to_i

d = b** 2 - 4 * a * c
x1 = (-b + Math.sqrt(d)) / (2 * a)
x2 = (-b - Math.sqrt(d)) / (2 * a)


if d > 0
	puts "2 roots, D = #{d}, x1 = #{x1}, x2 = #{x2}"
elsif d < 0
		puts "0 roots, D = #{d}"
		elsif d == 0
				puts "One root, D = #{d}, x = #{x1}"	
end