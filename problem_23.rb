# A perfect number is a number for which the sum of its proper divisors is exactly equal to the number. For example, the sum of the proper divisors of 28 would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect number.
# A number n is called deficient if the sum of its proper divisors is less than n and it is called abundant if this sum exceeds n.
# As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the smallest number that can be written as the sum of two abundant numbers is 24. By mathematical analysis, it can be shown that all integers greater than 28123 can be written as the sum of two abundant numbers. However, this upper limit cannot be reduced any further by analysis even though it is known that the greatest number that cannot be expressed as the sum of two abundant numbers is less than this limit.
# Find the sum of all the positive integers which cannot be written as the sum of two abundant numbers.

def is_abundant?(n)
  return false if n<2

  s = 1
  2.upto(Math.sqrt(n).to_i) do |i|
    if ((n % i) == 0 )
      s += i
      s += (n/i) unless (n/i == i)

      return true if s > n
    end
  end
  return false
end

time = Time.now
LIMIT = 20161
abundants = []

12.upto(LIMIT-12) do |p|
  abundants.push(p) if is_abundant?(p)
end

possibles = [false] * (LIMIT + 1)

abundants.each_with_index do |x, i|
  abundants[i..-1].each do |y|
    s = x + y

    if (s >= LIMIT)
      break
    else
      possibles[s] = true
    end
  end
end

sum = 0

possibles.each_with_index do |v, i|
  # sum += i unless v
  unless v
    sum += i
  end
end

puts sum

puts "#{Time.now - time} seconds"
