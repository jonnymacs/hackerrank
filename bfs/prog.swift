import Foundation
let q = Int(readLine()!)!

class Node {
  var id = Int()
  var graph_id = Int()
  var edges = [Int]()
  var level = Int(-1)
  var is_head = Bool()

  init(id: Int) {
    self.id = id
  }
}

for _ in 0..<q {
  let line1 = readLine()!.components(separatedBy: " ").map{ Int($0)! }
  let n = line1[0]
  let m = line1[1]
  var nodes = [Node]()

  for i in 0..<n+1 {
    nodes.append(Node(id: i))
  }

  for _ in 0..<m {
    let line = readLine()!.components(separatedBy: " ").map{ Int($0)! }
    let edge1_id = line[0]
    let edge2_id = line[1]

    let node1 = nodes[edge1_id]
    let node2 = nodes[edge2_id]

    node1.edges.append(node2.id)
    node2.edges.append(node1.id)
  }

  let s = Int(readLine()!)!
  let head_node = nodes[s]
  head_node.is_head = true
  head_node.level = 0
  var distances: [String] = Array(repeating: "-1", count: nodes.count)

  func set_levels(node_ids: [Int], level: Int) {
    var next_level_node_ids = [Int]()

    for node_id in node_ids {
      if nodes[node_id].level == -1 {
        nodes[node_id].level = level + 1
        distances[node_id] = String(describing: (level + 1) * 6)
        next_level_node_ids += nodes[node_id].edges
      }
    }
    if !next_level_node_ids.isEmpty { set_levels(node_ids: next_level_node_ids, level: level + 1) }
  }

  set_levels(node_ids: head_node.edges, level: 0)

  distances.remove(at: s)
  distances.remove(at: 0)

  print("\(distances.joined(separator: " "))")
}
