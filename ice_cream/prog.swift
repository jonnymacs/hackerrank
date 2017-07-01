import Foundation

let t = Int(readLine()!)!

struct Node {
  var id: Int
  var value: Int

  init(id: Int, value: Int) {
    self.id = id
    self.value = value
  }
}
// search in a sorted list for a target value
// using a binary search technique.
//
func binary_search(_ list: [Node], _ start: Int, _ end: Int, _ target: Int) -> Int {
  let subset = Array(list[start..<end+1])

  if subset.first!.value == target { return subset.first!.id }
  if subset.last!.value == target { return subset.last!.id }
  if subset.count == 2 { return -1 }

  let split_index = (subset.count / 2) + 1

  if subset[split_index].value == target { return subset[split_index].id }

  var new_start: Int, new_end: Int
  if subset[split_index].value > target {
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
  // Can't sort the list here b/c need to preserve the ids as index +!
  //
  let data = readLine()!.components(separatedBy: " ").map{ Int($0) }

  // build a list of nodes sorted by value
  var nodes = [Node]()
  for i in 0..<n { nodes.append(Node(id: i+1, value: data[i]!)) }
  nodes = nodes.sorted{ $0.value < $1.value }
  
  // or
  // let nodes = nodes.sorted{ (left, right) -> Bool in
  //   left.value < right.value
  // }
  for i in 0..<n {
    let current_node = nodes[i]
    let current_id = current_node.id
    let target = m - current_node.value
    
    if target < 0 { continue }
    
    let subset = Array(nodes[0..<i] + nodes[i+1..<n])
    let target_id = binary_search(subset, 0, n-2, target)
    
    // look for the target and return the id
    // if the target is not found, returns -1
    //
    if target_id != -1 {
      print("\(Array([current_id, target_id]).sorted().map{ String(describing: $0) }.joined(separator: " "))")
      break
    }
  }

}
