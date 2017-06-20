#!/bin/ruby

n = gets.strip.to_i
a = gets.strip.split(' ').map(&:to_i)

total_swaps = 0
n.times do |i|
  swaps = 0
  (n-1).times do |j|
    if a[j] > a[j+1]
       a[j], a[j+1] = a[j+1], a[j]
       swaps += 1
    end
  end
  total_swaps += swaps
  break if swaps == 0
end

puts "Array is sorted in #{total_swaps} swaps."
puts "First Element: #{a.first}"
puts "Last Element: #{a.last}"
