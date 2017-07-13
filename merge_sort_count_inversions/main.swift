import Foundation

func merge_sort(for ary: inout [Int], _ count_swaps: inout Int) {
  merge_sort(for: &ary, 0, ary.count - 1, &count_swaps)
}

func merge_sort(for ary: inout [Int], _ left_start: Int, _ right_end: Int, _ count_swaps: inout Int) {
  if left_start >= right_end { return }
  let middle = (left_start + right_end) / 2
  merge_sort(for: &ary, left_start, middle, &count_swaps)
  merge_sort(for: &ary, middle+1, right_end, &count_swaps)
  merge_halves(for: &ary, left_start, right_end, &count_swaps)
}

func merge_halves(for ary: inout [Int], _ left_start: Int, _ right_end: Int, _ count_swaps: inout Int) {
  var target: [Int] = Array(repeating: -1, count: (right_end + 1  - left_start))

  let middle = (left_start + right_end) / 2
  var index_l = left_start
  var index_r = middle+1

  for i in 0..<(right_end + 1 - left_start) {
    if index_r > right_end || (index_l <= middle && ary[index_l] <= ary[index_r]) {
      target[i] = ary[index_l]
      index_l+=1
    } else {
      count_swaps += index_r - left_start - i
      target[i] = ary[index_r]
      index_r+=1
    }
  }

  for i in left_start..<right_end + 1 {
    ary[i] = target[i - left_start]
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
  let n = Int(readLine()!)!
  var ary = splitToIntegers(readLine()!, count: n)
  //var ary = readLine()!.components(separatedBy: " ").map{ Int($0)! }
  var count_swaps = 0
  merge_sort(for: &ary, &count_swaps)
  print("\(count_swaps)")
}
