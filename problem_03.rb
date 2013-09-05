# The prime factors of 13195 are 5, 7, 13 and 29.
# What is the largest prime factor of the number 600851475143?

target_number = 600851475143
factors = []
prime_factors = []
last_number = target_number

1.upto(target_number) do |i|
  break if i > last_number
  
  next unless target_number % i == 0
  other_factor = target_number / i
  
  unless factors.include? i
    factors.push(i)
    factors.push(other_factor)
  end
  
  last_number = other_factor
end

factors.each do |factor|
  next if (factor == 1) || (factor == target_number)
  
  is_prime = true
  
  2.upto(factor - 1) do |i|
    if factor % i == 0
      is_prime = false
      break
    end
  end
  
  prime_factors.push(factor) if is_prime
end

puts prime_factors.sort[-1]