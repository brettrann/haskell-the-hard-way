#!/usr/bin/env ruby

def evenSum(list)
  list.select { |i| i.even? }.reduce(:+)
end

puts evenSum(1...5)
