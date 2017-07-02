import Foundation

// Class def for Trie
//
// Initializer builds a root
// node with no letter.
//
class Trie {
  private let root: Node

  init() {
    self.root = Trie.Node(letter: nil)
  }

  // Class def for Node in the Trie
  //
  // Initializer builds a Node with
  // the supplied letter and
  // initializes a counter.
  // num_partial_for holds the value
  // for how many words the node
  // is a substring for.
  // Letters are stored as utf8 int8
  // to speed up string splitting
  //
  private class Node {
    var letter: Int8?
    var children: [Int8: Node] = [:]
    var num_partial_for = 0
    // If we wanted this to be a _real_
    // trie, we'd store this data
    //
    // var makes_word = false
    // var word: String?

    init(letter: Int8?) {
      self.letter = letter
    }
  }

  // Public add_contact method
  // takes a string and adds it
  // to the trie
  //
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

  // Public find_num_contacts method
  // takes a string and returns an int
  // for how many words the string is a
  // substring for in the trie
  //
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

// read stdin
// either add contact
// or print how many contacts
// the string input is a
// substring for
// ex in:
// 4 - number of entries
// add hack
// add hackerrank
// find hac
// find hak
//
for i in 0..<n {
  let line = readLine()!.components(separatedBy: " ")
  if line[0] == "add" { trie.add_contact(name: line[1]) }
  else {
    counts += String(trie.find_num_contacts(for: line[1]))
    if i != n-1 { counts += "\n" }
  }
}
print("\(counts)")
