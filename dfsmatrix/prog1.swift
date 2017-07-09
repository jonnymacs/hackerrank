import Foundation

let n = Int(readLine()!)!
let m = Int(readLine()!)!

class Node {
  var value: Int8
  var address: String
  var graph_id: String?
  
  init(_ value: Int8, _ address: String) {
    self.value = value
    self.address = address
  }
}

var matrix = [String:Node]()

for i in 0..<n {
  let row = readLine()!.components(separatedBy: " ").map{ Int8($0)! }
  for (j, value) in row.enumerated() {
    let address = "\(i)\(j)"
    matrix[address] = Node(value, address)
  }
}

func build_graph(_ matrix: inout [String:Node], _ node: Node, _ count: inout Int) -> Int{
  let address = node.address.characters
  let x = Int(String(address.first!))!
  let y = Int(String(address.last!))!
  
  for yn in -1..<2 {
    for xn in -1..<2 {
      let n_address = "\(x+xn)\(y+yn)"
      if matrix[n_address] != nil, let n_node = matrix[n_address] {
        if n_node.value == 0 || n_node.graph_id != nil { continue }
        n_node.graph_id = node.graph_id
        count+=1
        count = build_graph(&matrix, n_node, &count)
      }
    }
  }
  return count
}

var max = 0
for (id,node) in matrix {
  if(node.value == 0 || node.graph_id != nil) { continue }
  node.graph_id = node.address
  var count = 1
  count = build_graph(&matrix, node, &count)
  max = max > count ? max : count
}

print("\(max)")