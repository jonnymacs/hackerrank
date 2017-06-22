let n = Int(readLine()!)!

// func num_ways(for s: Int, memo: inout [Int: Int]) -> Int {
//   if s == 0 { return 1 }
//   if s < 0 { return 0 }
//   if memo[s] != nil { return memo[s]! }
//   
//   memo[s] = num_ways(for: s-1, memo: &memo) + num_ways(for: s-2, memo: &memo) + num_ways(for: s-3, memo: &memo) 
//   return memo[s]!
// }

func fib_modified(for s: Int) -> Int {
  var seq = [1,2,4]
  if s < 4 { return seq[s-1] }
  for _ in 3..<s { seq = [seq[1] , seq[2], seq[0] + seq[1] + seq[2]] }
  return seq.last!
}

for _ in 0..<n {
  let s = Int(readLine()!)!
  // var memo: [Int: Int] = [:]
  // print("\(num_ways(for: s, memo: &memo))")
  print("\(fib_modified(for: s))")
}


