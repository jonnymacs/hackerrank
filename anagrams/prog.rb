#!/bin/ruby

a = gets.strip.chars.sort
b = gets.strip.chars.sort

count = 0
i = 0
while true do
  break if a[i].nil? || b[i].nil?
  if a[i] == b[i]
    i+=1
    next
  end
  count += 1
  if a[i] < b[i]
    a.delete_at(i)
  else
    b.delete_at(i)
  end
end

count += a[i].nil? ? (b.length - a.length) : (a.length - b.length)
puts count
