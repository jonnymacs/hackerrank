import Foundation

let data = readLine()!.components(separatedBy: " ").map{ Int($0)! }
let n = data[0]
let m = data[1]
let c = readLine()!.components(separatedBy: " ").map{ Int($0)! }

func num_ways(_ n: Int, _ m: Int, _ c: [Int], _ memo: inout [[Int]]) -> Int {
  if n == 0 { return 1 }
  if n < 0 || m <= 0 { return 0 }
  if memo[n-1][m-1] != -1 { return memo[n-1][m-1] }
  memo[n-1][m-1] = num_ways(n, m - 1, c, &memo) + num_ways(n - c[m-1], m, c, &memo)
  return memo[n-1][m-1]
}

var memo = Array(repeating: Array(repeating: -1, count: m), count: n)
let ways = num_ways(n, m, c, &memo)
print("\(String(describing: ways))")