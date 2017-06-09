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

for i in 0..<n {
  var row = readLine()!.components(separatedBy: [" "])
  for k in 0..<row.count {
    nodes[i+k] = Node(id: i+k, address: (i,k), value: Int(row[k])!)
  }
}

print("\(n)")
