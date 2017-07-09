import Foundation

let line1 = readLine()!.components(separatedBy: " ")
let ary2 = readLine()!.components(separatedBy: " ").map{ Int($0) }

var ary1: [Int?] = Array(repeating: nil, count: line1.count + ary2.count)
for (i,num) in line1.enumerated() { ary1[i] = Int(num)! }

func merge_sort_o_n(merge: [Int?], target: inout [Int?]) {
    
  var merge_i = merge.count - 1
  var target_i = 0
    
  for i in 0..<target.count {
    if target[i] == nil { 
      target_i = i - 1
      break
    }
  }
  
  for i in 0..<target.count {
    if target_i >= 0 && merge_i >= 0 {
      if target[target_i]! > merge[merge_i]! {
        target[target.count - 1 - i] = target[target_i]!
        target_i-=1
      } else { 
        target[target.count - 1 - i] = merge[merge_i]!
        merge_i-=1
      }
    }
  }
}

merge_sort_o_n(merge: ary2, target: &ary1)
print("\(ary1)")
