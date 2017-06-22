import Foundation
let n = Int(readLine()!)!
let ary = readLine()!.components(separatedBy: " ").map{ UInt8($0)! }
var xor = ary.first
for i in 0..<n-1 { xor = xor! ^ ary[i+1] }
print("\(String(describing: xor!))")
