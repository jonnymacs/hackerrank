n,m = gets.split(" ").map{|el| el.to_i }
c = gets.split(" ").map{|el| el.to_i }

# coin change forumula
# ways = ways to n with m-1 coins + ways to n - (c-1) with m coins

def ways(n, m, c, memo = {})
  return 1 if n == 0
  return 0 if n < 1 || m == 0
  memo[n] ||= {}
  return memo[n][m] if memo[n][m]
  memo[n][m] = ways(n, m-1, c, memo) + ways(n - c[m-1], m, c, memo)
  return memo[n][m]
end

puts ways(n, m, c)
