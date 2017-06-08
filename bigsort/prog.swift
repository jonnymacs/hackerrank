import Foundation;
var n = Int(readLine()!)!
var unsorted = [String]()
for _ in 0..<n { unsorted.append(readLine()!) }
var sorted = unsorted.sorted{ (left,right) -> Bool in
  if left.utf8.count == right.utf8.count { return left < right }
  return left.utf8.count < right.utf8.count
}
print("\(sorted.joined(separator: "\n"))")