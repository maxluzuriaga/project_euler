# Let d(n) be defined as the sum of proper divisors of n (numbers less than n which divide evenly into n).
# If d(a) = b and d(b) = a, where a ≠ b, then a and b are an amicable pair and each of a and b are called amicable numbers.
# For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110; therefore d(220) = 284. The proper divisors of 284 are 1, 2, 4, 71 and 142; so d(284) = 220.
# Evaluate the sum of all the amicable numbers under 10000.

def sum_divisors(n)
	s = 1

	2.upto(Math.sqrt(n).to_i + 1) do |i|
		if ((n % i) == 0 )
			s += i
			s += (n/i)
		end
	end

	return s
end

time = Time.now

poss = 1.upto(10000).map { |e| e if (e % 4) == 0 }.compact

total = 0

poss.each do |n|
	p = sum_divisors(n)
	if ((n != p) && (n == sum_divisors(p)))
		poss.delete(n)
		poss.delete(p)

		total += (n + p)

		puts "#{n} #{p}"
	end
end

puts total

puts "#{Time.now - time} seconds"
