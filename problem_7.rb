# By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.
# What is the 10001st prime number?

def nth_prime(n)
  lim = 125000

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
  return results[n-1]
end

puts nth_prime(10001)
