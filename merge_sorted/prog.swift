import Foundation
let ary1 = readLine()!.components(separatedBy: " ").map{ Int($0)! }.sorted()
let ary2 = readLine()!.components(separatedBy: " ").map{ Int($0)! }.sorted()
print("\(ary1)")
print("\(ary2)")

func merge_sorted(left: [Int], right: [Int]) -> [Int] {
  var target: [Int] = Array(repeating: -1, count: (left.count + right.count))
  var i_left = 0
  var i_right = 0

  for i in 0..<(left.count + right.count) {
  if i_left < left.count && left[i_left] <= right[i_right] {
    target[i] = left[i_left]
      i_left += 1
    } else if i_right < right.count {
      target[i] = right[i_right]
      i_right += 1
    } else {
      target[i] = left[i_left]
      i_left += 1
    }
  }
  return target
}

print("\(merge_sorted(left: ary1, right: ary2))")
