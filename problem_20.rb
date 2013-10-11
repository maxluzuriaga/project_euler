# n! means n × (n − 1) × ... × 3 × 2 × 1
# For example, 10! = 10 × 9 × ... × 3 × 2 × 1 = 3628800,
# and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.
# Find the sum of the digits in the number 100!

time = Time.now

def factorial(n)
	return n if n == 1

	return n * factorial(n-1)
end

puts factorial(100).to_s.split("").map { |n| n.to_i  }.inject(:+)

puts "#{Time.now - time} seconds"
