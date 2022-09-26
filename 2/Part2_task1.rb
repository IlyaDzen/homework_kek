months = {
  'Jan' => 31, 'Feb' => 28, 'Mar' => 31, 'Apr'=> 30, 'May' => 31, 'Jun' => 30, 
  'Jul' => 31, 'Aug' => 31, 'Sen' => 30, 'Oct' => 31, 'Nov' => 30, 'Dec' => 31
}

ind = 0
while ind < months.length do
  if months.values[ind] == 30
    puts months.keys[ind]
  end
  ind += 1
end