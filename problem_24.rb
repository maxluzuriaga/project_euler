# A permutation is an ordered arrangement of objects. For example, 3124 is one possible permutation of the digits 1, 2, 3 and 4. If all of the permutations are listed numerically or alphabetically, we call it lexicographic order. The lexicographic permutations of 0, 1 and 2 are:
# 012   021   102   120   201   210
# What is the millionth lexicographic permutation of the digits 0, 1, 2, 3, 4, 5, 6, 7, 8 and 9?

def fact(n)
  if (n<=1)
    return n
  else
    return n * fact(n-1)
  end
end

def nth_permutation(list, n)
  result = []

  list.length.times do |i|
    if n == 1
      result.push(list[0])
      list.delete_at(0)
      break
    end

    list.each_index do |v|
      poss = fact(list.length - 1)

      if ((poss * (v+1)) >= n)
        n -= ((poss * v))
        result.push(list[v])
        list.delete_at(v)

        break
      end
    end
  end

  print result.join("")
end

time = Time.now

puts nth_permutation([0,1,2,3,4,5,6,7,8,9], 1000000)

puts "#{Time.now - time} seconds"
