#!/bin/ruby
def fibonacci(n)
  return n if n < 2
  fib = [0,1]
  (2..n).each { fib = [fib.last, fib.first + fib.last] }
  fib.last
end

n = gets.to_i
puts fibonacci(n)
