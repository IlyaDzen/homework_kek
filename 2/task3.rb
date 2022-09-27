fib = []

index = 3

fib.push 1 
fib.push 1
fib.push 2

while fib.max <= 55
  fib.push(fib[index-1] + fib[index-2])
  index += 1
end

puts fib