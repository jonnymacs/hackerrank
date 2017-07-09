import Foundation;
let n = Int(readLine()!)!
let m = Int(readLine()!)!

class Node {
  var id: String
  var address: (x: Int, y: Int)
  var value: Int
  var graph_id: String?

  init(id: String, address: (Int, Int), value: Int) {
    self.id = id
    self.address = address
    self.value = value
  }
}

var nodes = [String: Node]()

func graph_size(size: inout Int, node: Node, nodes: inout [String: Node]) -> Int {  
  for x in -1..<2 {
    for y in -1..<2 {
      let neighbor_id = "\(node.address.x + x)\(node.address.y + y)"
      if nodes[neighbor_id] != nil, let neighbor_node = nodes[neighbor_id] {
        if(neighbor_node.value == 0 || neighbor_node.graph_id != nil){ continue }
        neighbor_node.graph_id = node.graph_id
        size+=1
        size = graph_size(size: &size, node: neighbor_node, nodes: &nodes)
      }
    }
  }
  return size
}

for x in 0..<n {
  var row = readLine()!.components(separatedBy: [" "])
  for y in 0..<row.count {
    var id = "\(x)\(y)"
    nodes[id] = Node(id: id, address: (x,y), value: Int(row[y])!)
  }
}

var largest = 0
for (id,node) in nodes {
  if(node.value == 0 || node.graph_id != nil) { continue }
  node.graph_id = node.id
  var size = 1
  size = graph_size(size: &size, node: node, nodes: &nodes)
  largest = largest > size ? largest : size
}

print("\(largest)")
