index = 0
hash = {}
summ = 0.to_f

while true == true
  puts 'Name'
  name = gets.chomp.to_s
  if name == 'stop'
    break
  end

  puts 'Price'
  price = gets.chomp.to_f

  puts 'Quantity'
  quantity = gets.chomp.to_i
  index =+ 1
  hash[name] = price, quantity, price * quantity
  summ = price * quantity + summ
end

puts hash
puts summ
