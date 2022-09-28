hash = {}
summ = 0

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
  hash[name] = { price: price, quantuty: quantity, sum: price * quantity}
  summ += price * quantity
end

puts hash
puts summ
