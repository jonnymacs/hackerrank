#!/bin/ruby
n,k = gets.strip.split(' ').map(&:to_i)
a = gets.strip.split(' ').map(&:to_i)
puts (a[k..n-1] << a[0..k-1]).join(" ")
