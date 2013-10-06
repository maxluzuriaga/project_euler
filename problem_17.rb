# If the numbers 1 to 5 are written out in words: one, two, three, four, five, then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.
# If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words, how many letters would be used?
# NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and forty-two) contains 23 letters and 115 (one hundred and fifteen) contains 20 letters. The use of "and" when writing out numbers is in compliance with British usage.

def to_string(num)
	teens = %w[eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen]
	ones = %w[one two three four five six seven eight nine]
	tens = %w[ten twenty thirty forty fifty sixty seventy eighty ninety]

	digits = num.to_s.split("").map { |e| e.to_i  }.reverse
	words = []
	write_and = false

	digits.each_with_index do |n, i|
		next if n == 0

		if ((i == 2) || (i == 3))
			if write_and
				words.push("and")
				write_and = false
			end
		end

		case i
		when 0
			if (digits[i+1] == 1)
				words.push(teens[n-1])
				digits[i+1] = 0
			else
				words.push(ones[n-1])
			end

			write_and = true
		when 1
			words.push(tens[n-1])

			write_and = true
		when 2
			words.push("hundred")
			words.push(ones[n-1])
		when 3
			words.push("thousand")
			words.push(ones[n-1])
		end
	end

	return words.reverse.join("")
end

time = Time.now

letters = 0

1.upto(1000) do |n|
	letters += to_string(n).length
end

puts letters

puts "#{Time.now - time} seconds"
