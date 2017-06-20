import Foundation

let line1 = readLine()!.components(separatedBy: " ").map{ Int($0)!}
guard let n = line1.first else { fatalError("fooey") }
let k = line1.last!
let a = readLine()!.components(separatedBy: " ").map{ Int($0)!}

var count = 0
for (i,num) in a.enumerated() {
  if (i+1 == n) { break }
  for j in i+1..<n { if((num + a[j])%k == 0) { count += 1 } }
}

print("\(count)")
