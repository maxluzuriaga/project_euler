# By starting at the top of the triangle below and moving to adjacent numbers on the row below, the maximum total from top to bottom is 23.
#    3
#   7 4
#  2 4 6
# 8 5 9 3
# That is, 3 + 7 + 4 + 9 = 23.
# Find the maximum total from top to bottom of the triangle below:

class Num

  attr_accessor :value
  attr_accessor :left_sum
  attr_accessor :right_sum

  def initialize(n)
    @value = n
    @left_sum = 0
    @right_sum = 0
  end

  def max
    [@left_sum, @right_sum, @value].max
  end

end

time = Time.now

$triangle = "75
95 64
17 47 82
18 35 87 10
20 04 82 47 65
19 01 23 75 03 34
88 02 77 73 07 63 67
99 65 04 28 06 16 70 92
41 41 26 56 83 40 80 70 33
41 48 72 33 47 32 37 16 94 29
53 71 44 65 25 43 91 52 97 51 14
70 11 33 28 77 73 17 78 39 68 17 57
91 71 52 38 17 14 91 43 58 50 27 29 48
63 66 04 68 89 53 67 30 73 16 69 87 40 31
04 62 98 27 23 09 70 98 73 93 38 53 60 04 23".split("\n").map { |l| l.split(" ").map { |n| Num.new(n.to_i)  }  }

($triangle.length - 2).downto(0) do |n|
  row = $triangle[n]
  lastrow = $triangle[n+1]

  0.upto(row.length-1) do |i|
    num = row[i]
    left = lastrow[i]
    right = lastrow[i+1]

    num.left_sum = num.value + left.max
    num.right_sum = num.value + right.max
  end
end

puts $triangle[0][0].max

puts "#{Time.now - time} seconds"
