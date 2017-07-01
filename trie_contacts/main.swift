import Foundation

class Trie {
  private let root: Node
  
  init() {
    self.root = Trie.Node(letter: nil)
  }

  private class Node {
    var letter: Int8?
    var children: [Int8: Node] = [:]
    var num_partial_for = 0
    // var makes_word = false
    // var word: String?

    init(letter: Int8?) {
      self.letter = letter
    }
  }
    
  func add_contact(name: String) {
    var parent = root
    var child: Node?

    for char in name.utf8 {
      let letter = Int8(char)
      if parent.children[letter] == nil {
        child = Trie.Node(letter: letter)
        parent.children[letter] = child
      }
      parent = parent.children[letter]!
      parent.num_partial_for += 1
    }
    // parent.makes_word = true
    // parent.word = name
  }

  func find_num_contacts(for input: String) -> Int {    
    var parent = root
    for char in input.utf8 {
      let letter = Int8(char)
      if parent.children[letter] == nil { return 0 }
      else {
        parent = parent.children[letter]!
      }
    }
    return parent.num_partial_for
  }
  
}

let trie = Trie()
let n = Int(readLine()!)!
var counts = ""

for i in 0..<n {
  let line = readLine()!.components(separatedBy: " ")
  if line[0] == "add" { trie.add_contact(name: line[1]) }
  else { 
    counts += String(trie.find_num_contacts(for: line[1]))
    if i != n-1 { counts += "\n" }
  }
}
print("\(counts)")
