# The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
# Find the sum of all the primes below two million.

def sum_under(lim)
  primes = Array.new(lim) { |e| true }
  primes[0] = false
  primes[1] = false
  
  (2..Math.sqrt(lim)).each do |ind|
    if primes[ind]
      
      x = ind**2
      while x < lim do
        if primes[x]
          primes[x] = false
        end
        
        x += ind
      end
    end
  end
  
  results = primes.each_with_index.map { |v,i| i if v }.compact
  return results.inject(:+)
end

puts sum_under(2000000)
