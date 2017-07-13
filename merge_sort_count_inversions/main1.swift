import Foundation

public func merge_sort(for ary: inout [Int], _ length: Int, count_swaps: inout Int) {
  var helper: [Int] = Array(repeating: -1, count: length)
  merge_sort(for: &ary, &helper, 0, length - 1, &count_swaps)
}

public func merge_sort(for ary: inout [Int], _ helper: inout [Int], _ left_start: Int, _ right_end: Int, _ count_swaps: inout Int) {
  if left_start >= right_end { return }
  let middle = (left_start + right_end) / 2
  merge_sort(for: &ary, &helper, left_start, middle, &count_swaps)
  merge_sort(for: &ary, &helper, middle + 1, right_end, &count_swaps)
  merge_halves(for: &ary, &helper, left_start, middle, right_end, &count_swaps)
}

public func merge_halves(for ary: inout [Int], _ helper: inout [Int], _ left_start: Int, _ middle: Int, _ right_end: Int, _ count_swaps: inout Int) {

  for i in left_start..<(right_end + 1) {
    helper[i] = ary[i]
  }

  var index_l = left_start
  var index_r = middle + 1
  var current = left_start

  while(index_l <= middle && index_r <= right_end) {
    if helper[index_l] <= helper[index_r] {
      ary[current] = helper[index_l]
      index_l += 1
    } else {
      count_swaps += index_r - current
      ary[current] = helper[index_r]
      index_r += 1
    }
    current += 1
  }

  let remaining = middle + 1 - index_l
  for i in 0..<remaining {
    ary[current + i] = helper[index_l + i]
  }

}

public func splitToIntegers(_ s: String, count: Int) -> [Int] {
    var result: [Int] = []
    result.reserveCapacity(count)
    var n = 0
    let scanner = Scanner(string: s)
    while scanner.scanInt(&n) {
        result.append(n)
    }
    return result
}

let d = Int(readLine()!)!
for _ in 0..<d {
  let length = Int(readLine()!)!
  var ary = splitToIntegers(readLine()!, count: length)
  //var ary = readLine()!.components(separatedBy: " ").map{ Int($0)! }
  var count_swaps = 0
  merge_sort(for: &ary, length, count_swaps: &count_swaps)
  print("\(count_swaps)")
}
