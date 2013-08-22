# 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
# What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

x = 1

2.upto(20) do |n|
  x = x.lcm(n)
end

puts x
