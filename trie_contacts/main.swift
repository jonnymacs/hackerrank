import Foundation

class Node {
  var letter: Character
  var children: [Character: Node] = [:]
  var makes_word = false
  var num_partial_for = 0

  init(letter: Character) {
    self.letter = letter
  }
}

func add_contact(name: String, trie: Node) {
  var parent = trie
  var child: Node?

  for char in name.characters {
    if parent.children[char] == nil {
      child = Node(letter: char)
      parent.children[char] = child
    }
    parent = parent.children[char]!
    parent.num_partial_for += 1
  }
  if child != nil { child!.makes_word = true }
}

func find_num_contacts(for input: String, trie: Node) -> Int {
  var parent = trie
  let characters = input.characters

  for char in characters {
    if char == characters.last && parent.children[char] == nil { return 0 }
    if parent.children[char] != nil { parent = parent.children[char]! }
  }
  return parent.num_partial_for
}

let root = Node(letter: Character("-"))

let n = Int(readLine()!)!
var counts: [Int] = []
for _ in 0..<n {
  let line = readLine()!.components(separatedBy: " ")
  if line[0] == "add" { add_contact(name: line[1], trie: root) }
  else { counts.append(find_num_contacts(for: line[1], trie: root)) }
}
print("\(counts.map{ String(describing: $0) }.joined(separator: "\n"))")
