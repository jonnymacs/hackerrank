#!/bin/ruby

m,n = gets.strip.split(' ').map(&:to_i)
magazine = {}
gets.strip.split(' ').each do |word|
  magazine[word] ||= 0
  magazine[word] += 1
end

can_do = true
gets.strip.split(' ').each do |word|
  if magazine[word] > 0
    magazine[word] -= 1
  else
    can_do = false
    break
  end
end
puts can_do ? "Yes" : "No"
