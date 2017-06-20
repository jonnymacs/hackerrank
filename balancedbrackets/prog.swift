import Foundation

struct Stack<Element> {
    var items = [Element]()
    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
    func isEmpty() -> Bool {
      return items.isEmpty
    }
}

func is_balanced(expression: [Character]) -> Bool {
  var stack = Stack<Character>()
  for char in expression {
    if char == "{" { stack.push("}") }
    else if char == "(" { stack.push(")") }
    else if char == "[" { stack.push("]") }
    else {
      if(stack.isEmpty() || stack.pop() != char) { return false }
    }
  }
  return stack.isEmpty()
}

let n = Int(readLine()!)!
for i in 0..<n {
  let expression = Array(readLine()!.characters)
  is_balanced(expression: expression) ? print("YES") :  print("NO")
}
