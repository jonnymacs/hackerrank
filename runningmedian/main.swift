import Foundation
extension String: Error {}

func median_of_min_and_max_heaps(_ min_heap:  MinHeapInt, _ max_heap: MaxHeapInt) -> Double {
  if (min_heap.count() + max_heap.count()) % 2 == 0 {
    do {
      let median_upper = try min_heap.peek()
      let median_lower = try max_heap.peek()
      return Double(median_lower) + (Double(median_upper) - Double(median_lower)) / 2
    } catch { print(error) }
  } else {
    do {
      let median_upper = try min_heap.peek()
      return Double(median_upper)
    } catch { print(error) }
  }
  return Double(0)
}

let min_heap = MinHeapInt()
let max_heap = MaxHeapInt()
let n = Int(readLine()!)!

for _ in 0..<n {
  let a = Int(readLine()!)!
  print(a)
  if min_heap.count() == 0 {
    min_heap.add(a)
    print(String(describing: median_of_min_and_max_heaps(min_heap, max_heap)))
    continue
  }

  // heaps have equal length
  //
  if (min_heap.count() + max_heap.count()) % 2 == 0 {
    do {
      let median_upper = try min_heap.peek()
      if a > median_upper {
        min_heap.add(a)
      } else {
        max_heap.add(a)
        let median_lower = try max_heap.poll()
        min_heap.add(median_lower)
      }
    } catch { print(error) }

    print(String(describing: median_of_min_and_max_heaps(min_heap, max_heap)))
    continue
  }

  // min heap has 1 more value
  //
  do {
    var median_upper = try min_heap.peek()
    if a > median_upper {
      min_heap.add(a)
      median_upper = try min_heap.poll()
      max_heap.add(median_upper)
    } else {
      max_heap.add(a)
    }
  } catch { print(error) }
  print(String(describing: median_of_min_and_max_heaps(min_heap, max_heap)))

}
