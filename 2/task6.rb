hash = {}
summ = 0.to_f

loop do
  puts 'Name'
  name = gets.chomp.to_s
  if name == 'stop'
    break
  end

  puts 'Price'
  price = gets.chomp.to_f

  puts 'Quantity'
  quantity = gets.chomp.to_i
  hash[name] = price, quantity, price * quantity
  summ = price * quantity + summ
end

puts hash
puts summ
