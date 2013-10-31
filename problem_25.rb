# The Fibonacci sequence is defined by the recurrence relation:
# Fn = Fn−1 + Fn−2, where F1 = 1 and F2 = 1.
# What is the first term in the Fibonacci sequence to contain 1000 digits?

def first_fib_with_n_digits(n)
  fone = 1
  ftwo = 0
  count = 2

  num = 1

  until (num >= (10**(n-1)))
    ftwo = fone
    fone = num

    num = fone + ftwo
    count += 1
  end

  return count
end

time = Time.now

puts first_fib_with_n_digits(1000)

puts "#{Time.now - time} seconds"
