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
  for node_id in head_node.edges {
    nodes[node_id].level = 1
  }

  func set_level(node_ids: [Int], level: Int) {
    var next_level_node_ids = [Int]()
    for node_id in node_ids {
      if nodes[node_id].level == level {
        for edge_node_id in nodes[node_id].edges {
          if nodes[edge_node_id].level == -1 {
            nodes[edge_node_id].level = level + 1
            next_level_node_ids.append(edge_node_id)
          }
        }
      }
    }

    for node_id in next_level_node_ids {
      let edge_node = nodes[node_id]
      set_level(node_ids: edge_node.edges, level: level + 1)
    }
  }

  set_level(node_ids: head_node.edges, level: 1)

  var distances = [String]()
  for node in nodes {
    if node.id == 0 || node.is_head { continue }
    let distance = node.level == -1 ? -1 : node.level * 6
    distances.append(distance.description)
  }
  print("\(distances.joined(separator: " "))")
}
