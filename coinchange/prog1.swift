import Foundation
let line = readLine()!.components(separatedBy: " ").map{ Int($0)! }
let (n, m): (Int, Int) = (line[0],line[1])
let c = readLine()!.components(separatedBy: " ").map{ Int($0)! }

func ways(_ n: Int, _ m: Int, _ c: [Int], _ w: inout [Int:[Int:Int]]) -> Int {
  if n == 0 { return 1 }
  if n < 1 || m == 0 { return 0 }
  if let res = w[n]?[m] { return res }
  w[n] = w[n] ?? [Int:Int]()
  w[n]?[m] = ways(n, m-1, c, &w) + ways(n-c[m-1], m, c, &w)
  return w[n]![m]!
}

var w = [Int:[Int:Int]]()
print("\(String(describing: ways(n, m, c, &w)))")
