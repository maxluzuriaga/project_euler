# Using names.txt, a 46K text file containing over five-thousand first names, begin by sorting it into alphabetical order. Then working out the alphabetical value for each name, multiply this value by its alphabetical position in the list to obtain a name score.
# For example, when the list is sorted into alphabetical order, COLIN, which is worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the list. So, COLIN would obtain a score of 938 × 53 = 49714.
# What is the total of all the name scores in the file?

time = Time.now

File.open("names.txt", "r").each_line do |line|
  $names = line[1..-2].split('","')
end

def quicksort(arr)
  return arr if arr.length <= 1

  pivot = arr.delete_at((arr.length/2).to_i)

  less = []
  greater = []

  arr.each do |n|
    if (n <= pivot)
      less.push(n)
    else
      greater.push(n)
    end
  end

  return quicksort(less) + [pivot] + quicksort(greater)
end

$names = quicksort($names)

sum = 0
alphabet = "abcdefghijklmnopqrstuvwxyz".upcase

$names.each_with_index do |n, index|
  sum += (index + 1) * n.split("").map { |c| alphabet.index(c) + 1 }.inject(:+)
end

puts sum

puts "#{Time.now - time} seconds"
