import Foundation

let t = Int(readLine()!)!

struct Node {
  var index: Int
  var cost: Int

  init(_ index: Int, _ cost: Int) {
    self.index = index
    self.cost = cost
  }
}

func binary_search(_ list: [Node], _ start: Int, _ end: Int, _ target: Int) -> Int {
  let subset = Array(list[start..<end+1])

  if subset.first!.cost == target { return subset.first!.index }
  if subset.last!.cost == target { return subset.last!.index }
  if subset.count == 2 { return -1 }

  let split_index = (subset.count / 2) + 1

  if subset[split_index].cost == target { return subset[split_index].index }

  var new_start: Int
  var new_end: Int
  if subset[split_index].cost > target {
    new_start = 0
    new_end = split_index - 1
  } else {
    new_start = split_index - 1
    new_end = subset.count - 1
  }
  return binary_search(subset, new_start, new_end, target)
}

for _ in 0..<t {
  let m = Int(readLine()!)!
  let n = Int(readLine()!)!
  let data = readLine()!.components(separatedBy: " ").map{ Int($0) }

  var nodes = [Node]()
  for i in 0..<n {
    nodes.append(Node(i+1, data[i]!))
  }

  let sorted_nodes = nodes.sorted{ (left, right) -> Bool in
    left.cost < right.cost
  }

  for i in 0..<n {
    let current_node = sorted_nodes[i]
    let current_index = current_node.index
    let target = m - current_node.cost
    if target < 0 { continue }
    let subset = Array(sorted_nodes[0..<i] + sorted_nodes[i+1..<n])
    let target_index = binary_search(subset, 0, n-2, target)

    if target_index != -1 {
      print("\(Array([current_index, target_index]).sorted().map{ String(describing: $0) }.joined(separator: " "))")
      break
    }
  }

}
