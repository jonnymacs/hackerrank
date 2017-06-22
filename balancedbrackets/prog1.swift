import Foundation

let n = Int(readLine()!)!

struct Stack<Element> {
  var items: [Element] = []

  mutating func push(el: Element) {
    items.append(el)
  }

  mutating func pop() -> Element {
    return items.removeLast()
  }

  func isEmpty() -> Bool {
    return items.isEmpty
  }
}

func is_balanced(_ expression: [Character]) -> Bool {
  let pairs: [Character:Character] = ["{":"}","[":"]","(":")"]
  var stack = Stack<Character>()
  if(pairs[expression.first!] == nil) { return false }
  else {
    for char in expression {
      if pairs[char] != nil { stack.push(el: pairs[char]!) }
      else { if stack.isEmpty() || stack.pop() != char { return false } }
    }
  }
  return stack.isEmpty()
}

for _ in 0..<n {
  let expression = Array(readLine()!.characters)
  is_balanced(expression) ? print("YES") : print("NO")
}
