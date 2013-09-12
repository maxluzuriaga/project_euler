# The sequence of triangle numbers is generated by adding the natural numbers. So the 7th triangle number would be 1 + 2 + 3 + 4 + 5 + 6 + 7 = 28. The first ten terms would be:
# 1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...
# Let us list the factors of the first seven triangle numbers:
#  1: 1
#  3: 1,3
#  6: 1,2,3,6
# 10: 1,2,5,10
# 15: 1,3,5,15
# 21: 1,3,7,21
# 28: 1,2,4,7,14,28
# We can see that 28 is the first triangle number to have over five divisors.
# What is the value of the first triangle number to have over five hundred divisors?

time = Time.now

lim = 20

$primes = Array.new(lim) { |e| true }
$primes[0] = false
$primes[1] = false

(2..Math.sqrt(lim)).each do |ind|
  if $primes[ind]
    
    x = ind**2
    while x < lim do
      if $primes[x]
        $primes[x] = false
      end
      
      x += ind
    end
  end
end

$primes = $primes.each_with_index.map { |v,i| i if v }.compact

def num_factors(num)
  if num == 1
    return 1
  end

  powers = {}

  $primes.each do |prime|
    powers[prime] = 0

    while ((num % prime) == 0) do
      num = num / prime

      powers[prime] = powers[prime] + 1
    end

    if num == 1
      break
    end
  end

  powers_array = powers.map do |pow|
    if (pow[1] > 0)
      pow[1]
    else
      nil
    end
  end.compact

  tot = 1
  powers_array.each do |p|
    tot *= (p+1)
  end

  return tot
end

triangle = 0
inc = 1

while true do
  triangle += inc

  inc += 1

  if (num_factors(triangle) > 500)
    puts triangle
    break
  end
end

puts "#{Time.now - time} seconds"