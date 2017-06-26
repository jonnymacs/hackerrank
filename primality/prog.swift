import Foundation;
let p = Int(readLine()!)!

func is_prime(_ num: Int) -> Bool {
  if num == 1 || num == 0 { return false }
  for i in 2..<(Int(sqrt(Double(num))) + 1) { if num%i == 0 { return false } }
  return true
}

for _ in 0..<p { is_prime(Int(readLine()!)!) ? print("Prime") : print("Not prime") }
