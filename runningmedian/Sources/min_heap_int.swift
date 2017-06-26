public class MinHeapInt : Heap<Int> {

  override func heapifyDown() {
    var index = 0
    while has_left_child(for_index: index) {
      if has_right_child(for_index: index) &&
         right_child(for_index: index) < left_child(for_index: index) &&
         right_child(for_index: index) < items[index] {
        do { try swap(index1: right_child_index(for_index: index), index2: index) } catch { print(error) }
        index = right_child_index(for_index: index)
      }
      else if left_child(for_index: index) < items[index] {
        do { try swap(index1: left_child_index(for_index: index), index2: index) } catch { print(error) }
        index = left_child_index(for_index: index)
      } else {
        break
      }
    }
  }

  override func heapifyUp() {
    var index = count() - 1
    while has_parent(for_index: index) {
      if parent(for_index: index) > items[index] {
        do { try swap(index1: parent_index(for_index: index), index2: index) } catch { print(error) }
        index = parent_index(for_index: index)
      } else {
        break
      }
    }
  }

}
