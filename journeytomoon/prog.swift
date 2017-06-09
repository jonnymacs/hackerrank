import Foundation;
var line = readLine()!.components(separatedBy: [" "])
let n = Int(line[0])!
let p = Int(line[1])!

class Node {
    var id : Int!
    var edges: [Int]
    var graph_id: Int?

    init(id: Int) {
        self.id = id
        self.edges = []
    }
}

var nodes = [Int: Node]()
var graph_sizes = [Int]()

func graph_size(size: inout Int, node: Node, nodes: inout [Int: Node]) -> Int {
  for edge_id in node.edges {
    if(nodes[edge_id]?.graph_id != nil){ continue }
    nodes[edge_id]?.graph_id = node.graph_id
    size+=1
    size = graph_size(size: &size, node: nodes[edge_id]!, nodes: &nodes)
  }
  return size
}

for _ in 0..<p {
  var line = readLine()!.components(separatedBy: [" "])
  var a = Int(line[0])!
  var b = Int(line[1])!
  nodes[a] = nodes[a] ?? Node(id: a)
  nodes[a]?.edges.append(b)
  nodes[b] = nodes[b] ?? Node(id: b)
  nodes[b]?.edges.append(a)
}

for (id,node) in nodes {
  if(node.graph_id != nil) { continue }
  node.graph_id = id
  var size = 1
  var gs = graph_size(size: &size, node: node, nodes: &nodes)
  graph_sizes.append(gs)
}

var single_nodes = (n - nodes.count)
var count = 0
for _ in 0..<graph_sizes.count {
  var gs = graph_sizes.removeFirst()
  var remaining_nodes = graph_sizes.reduce(0,+) + single_nodes
  count += gs * remaining_nodes
}

if(single_nodes > 1) { for i in 1..<single_nodes { count += i }}

print("\(count)")
