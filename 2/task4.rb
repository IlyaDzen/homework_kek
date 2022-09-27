alpha = ('a'..'z').to_a
vowels = ['a','e','i','u','y','o']
hash = {}

alpha.each_with_index do |el, index| 
  index += 1
  if vowels.include?(el)
    hash[el] = index
  end
end

p hash
