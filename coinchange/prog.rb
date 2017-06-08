#!/bin/ruby

def get_ways(n,c,m)

  return 1 if n == 0
  return 0 if n < 0 || m <=0

  @mem_ways ||= []
  @mem_ways[n] ||= []

  if !!@mem_ways[n][m]
    return @mem_ways[n][m]
  else
    @mem_ways[n][m] = get_ways(n,c,m-1) + get_ways(n - c[m-1],c,m)
  end
end

n, m = gets.strip.split(' ').map(&:to_i)
c = gets.strip.split(' ').map(&:to_i)

# Print the number of ways of making change for 'n' units using coins having the values given by 'c'
ways = get_ways(n,c,m)
puts ways
