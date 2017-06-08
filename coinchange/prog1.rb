# how to get the list of ways

#!/bin/ruby

def get_ways(n,c,m)

  return 1 if n == 0
  return 0 if n < 0 || m <=0

  @vals ||= []
  @mem_ways ||= []
  @mem_ways[n] ||= []

  if !!@mem_ways[n][m]
    return @mem_ways[n][m]
  else
    tmp = get_ways(n,c,m-1)
    tmp1 = get_ways(n - c[m-1],c,m)
    @vals << c[m-1] if tmp1 == 1
    @vals << c[m-1] if tmp1 == 1
    @mem_ways[n][m] = tmp + tmp1
  end
end

n, m = gets.strip.split(' ').map(&:to_i)
c = gets.strip.split(' ').map(&:to_i)

# Print the number of ways of making change for 'n' units using coins having the values given by 'c'
ways = get_ways(n,c,m)
puts ways
p @vals
