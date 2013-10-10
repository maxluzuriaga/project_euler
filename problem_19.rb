# You are given the following information, but you may prefer to do some research for yourself.
# 1 Jan 1900 was a Monday.
# Thirty days has September,
# April, June and November.
# All the rest have thirty-one,
# Saving February alone,
# Which has twenty-eight, rain or shine.
# And on leap years, twenty-nine.
# A leap year occurs on any year evenly divisible by 4, but not on a century unless it is divisible by 400.
# How many Sundays fell on the first of the month during the twentieth century (1 Jan 1901 to 31 Dec 2000)?

time = Time.now

days = 0
sundays = 0

1900.upto(2000) do |year|
  1.upto(12) do |month|
    unless (year == 1900)
      if ((days % 7) == 6)
        sundays += 1
      end
    end

    case month
    when 9, 4, 6, 11
      # Thirty days has September, April, June, and November
      days += 30
    when 2
      days += 28
      if ((year % 100) == 0)
        days += 1 if ((year % 400) == 0) # Leap year
      else
        days += 1 if ((year % 4) == 0) # Leap year
      end
    else
      # All the rest have thiry-one
      days += 31
    end
  end
end

puts sundays

puts "#{Time.now - time} seconds"
