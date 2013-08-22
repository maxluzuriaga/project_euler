# A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91  99.
# Find the largest palindrome made from the product of two 3-digit numbers.

palindromic_numbers = []

100.upto(999) do |x|
  100.upto(999) do |y|
    product = x * y
    
    palindromic_numbers.push(product) if product.to_s == product.to_s.reverse
  end
end

puts palindromic_numbers.max
