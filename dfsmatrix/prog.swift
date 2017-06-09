import Foundation;
let n = Int(readLine()!)!
let m = Int(readLine()!)!

class Node {
  var id: Int
  var address: (x: Int, y: Int)
  var value: Int
  var graph_id: Int?

  init(id: Int, address: (Int, Int), value: Int) {
    self.id = id
    self.address = address
    self.value = value
  }
}

var nodes = [Int: Node]()

func graph_size(size: inout Int, node: Node, nodes: inout [Int: Node]) -> Int {
  var neighbor_nodes = [(Int,Int)]

  for i in -1..<1 {
    for k in -1..<1 {
      //todo buid list of neighbor nodes
    }
  }
  for id in neighbor_nodes {
    if(nodes[id] == nil || nodes[id]?.value == 0 || nodes[id]?.graph_id != nil || ){ continue }
    neighbor_node.graph_id = node.graph_id
    size+=1
    size = graph_size(size: &size, node: neighbor_node!, nodes: &nodes)
  }
  return size
}

for i in 0..<n {
  var row = readLine()!.components(separatedBy: [" "])
  for k in 0..<row.count {
    nodes[i+k] = Node(id: i+k, address: (i,k), value: Int(row[k])!)
  }
}

print("\(n)")
