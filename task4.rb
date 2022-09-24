puts "first index"
a = gets.chomp

puts "second index"
b = gets.chomp

puts "third index"
c = gets.chomp

D = b.to_i ** 2 - 4 * a.to_i * c.to_i
x1 = (-b.to_i + Math.sqrt(D.to_i)) / (2 * a.to_i)
x2 = (-b.to_i - Math.sqrt(D.to_i)) / (2 * a.to_i)


if D > 0
	puts "2 roots, D = #{b.to_i ** 2 - 4 * a.to_i * c.to_i}, x1 = #{x1}, x2 = #{x2}"
else 
	if D < 0
		puts "0 roots, D = #{b.to_i ** 2 - 4 * a.to_i * c.to_i}"
		else 
			if D == 0
				puts "One root, D = #{b.to_i ** 2 - 4 * a.to_i * c.to_i}, x = #{x1}"	
			end
	end
end