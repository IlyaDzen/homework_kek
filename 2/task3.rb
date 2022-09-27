fib = [1, 1, 2]

while fib.last(2).sum <= 100
  fib.push(fib.last(2).sum)
end

puts fib