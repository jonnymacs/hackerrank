extension String: Error {}
public class Heap<Element> {

  var items: [Element]
  init() { self.items = [] }

  func left_child_index(for_index index: Int) -> Int { return index * 2 + 1 }
  func right_child_index(for_index index: Int) -> Int { return index * 2 + 2 }
  func parent_index(for_index index: Int) -> Int { return ((index + 1) / 2) - 1 }

  func has_left_child(for_index index: Int) -> Bool { return left_child_index(for_index: index) < count() }
  func has_right_child(for_index index: Int) -> Bool { return right_child_index(for_index: index) < count() }
  func has_parent(for_index index: Int) -> Bool { return parent_index(for_index: index) >= 0 }

  func left_child(for_index index: Int) -> Element { return items[left_child_index(for_index: index)] }
  func right_child(for_index index: Int) -> Element { return items[right_child_index(for_index: index)] }
  func parent(for_index index: Int) -> Element { return items[parent_index(for_index: index)] }

  func swap(index1: Int, index2: Int) throws {
    if index1 > count() { throw("Invalid Index: \(index1)") }
    if index2 > count() { throw("Invalid Index: \(index2)") }

    let tmp = items[index1]
    items[index1] = items[index2]
    items[index2] = tmp
  }

  func peek() throws -> Element {
    if count() == 0 { throw("Heap is Empty") }
    return items[0]
  }

  func poll() throws -> Element {
    if count() == 0 { throw("Heap is Empty")}
    let item = items[0]
    items[0] = items.removeLast()
    heapifyDown()
    return item
  }

  func add(_ value: Element) {
    items.append(value)
    heapifyUp()
  }

  func count() -> Int {
    return items.count
  }

  func heapifyUp() { fatalError("Must Override") }
  func heapifyDown() { fatalError("Must Override") }

}
