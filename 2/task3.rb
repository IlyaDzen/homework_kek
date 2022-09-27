fib = [1, 1, 2]

while fib.last <= 100
  fib.push(fib.last(2).sum)
end

fib.delete_if{|fib| fib > 100}

puts fib