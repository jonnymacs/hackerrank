import Foundation

let n = Int(readLine()!)!
var a = readLine()!.components(separatedBy: " ").map{ Int($0)! }

var total_swaps = 0
for i in 0..<n {
  var swaps = 0
  for j in 0..<n-1 {
    if a[j] > a[j+1] {
      swap(&a[j],&a[j+1])
      swaps+=1
    }
  }
  total_swaps += swaps
  if swaps == 0 { break }
}

print("Array is sorted in \(total_swaps) swaps.")
print("First Element: \(a.first!)")
print("Last Element: \(a.last!)")
