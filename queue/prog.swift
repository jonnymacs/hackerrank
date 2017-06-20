import Foundation

class Stack<Element> {
  var items = [Element]()

  func push(_ el: Element) {
    items.append(el)
  }

  func pop() -> Element {
    return items.removeLast()
  }

  func tail() -> Element {
    return items.last!
  }

  func length() -> Int {
    return items.count
  }

  func empty() -> Bool {
    return length() == 0
  }
}

class Queue<Element> {
  var s1 = Stack<Element>()
  var s2 = Stack<Element>()

  func enqueue(_ el: Element) {
    s1.push(el)
  }

  func dequeue() {
    shift()
    _ = s2.pop()
  }

  func head() -> Element {
    shift()
    return s2.tail()
  }

  private

  func shift() {
    if s2.empty() {
       for _ in 0..<s1.length() {
         s2.push(s1.pop())
       }
    }
  }
}

let q = Int(readLine()!)!
var queue = Queue<Int>()
for i in 0..<q {
  let line = readLine()!.components(separatedBy: " ").map{ Int($0)! }
  var type = line[0]
  switch type {
  case 1:
    queue.enqueue(line[1])
  case 2:
    queue.dequeue()
  case 3:
    print("\(queue.head())")
  default:
    print("Unsupported Type")
  }
}
