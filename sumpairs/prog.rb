#!/bin/ruby
n,k = gets.split(" ").map(&:to_i)
a = gets.split(" ").map(&:to_i)

count = 0
a.each_with_index do |num,i|
  break if i+1 == n
  (i+1..n-1).each do |j|
    count += 1 if (num + a[j])%k == 0
  end
end
puts count
