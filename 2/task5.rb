puts 'Day'
day = gets.chomp.to_i

puts 'Month'
month = gets.chomp.to_i

puts 'Year'
year = gets.chomp.to_i

array = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30 ,31]
array_leap = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30 ,31]

number = array.first(month - 1).sum + day
number_leap = array_leap.first(month - 1).sum + day

if year % 4 == 0 or (year % 100 == 0 and year % 400 == 0)
  puts number_leap
else 
  puts number
end