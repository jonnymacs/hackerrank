import Foundation;
var a = Array(readLine()!.characters).sorted()
var b = Array(readLine()!.characters).sorted()

var count = 0
var i = 0

while true {
  if a.count == i || b.count == i {
    break
  }
  if a[i] == b[i] {
    i+=1
    continue
  }
  count+=1
  if a[i] < b[i] {
    a.remove(at: i)
  } else {
    b.remove(at: i)
  }
}
count += (a.count == i) ? b.count - a.count : a.count - b.count
print("\(count)")
