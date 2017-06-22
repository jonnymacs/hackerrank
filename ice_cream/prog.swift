import Foundation

struct IceCream {
  var index: Int
  var cost: Int
  
  init(_ index: Int, _ cost: Int) {
    self.index = index
    self.cost = cost
  }
}

func binary_search(_ sorted_ice_creams: [IceCream], _ start: Int, _ end: Int, _ target: Int) -> Int {
  let subset = Array(sorted_ice_creams[start..<end])

  let first = subset.first!
  let last = subset.last!
  
  if (first.cost == target) { return first.index }
  if (last.cost == target) { return last.index }
  if (subset.count == 1 || subset.count == 2) { return -1 }
  
  let split = (subset.count / 2) + 1
  
  if subset[split-1].cost > target {
    return binary_search(subset, 0, subset.count - split, target)
  } else if subset[split-1].cost < target {
    return binary_search(subset, split, subset.count, target)
  } else if subset[split-1].cost == target {
    return subset[split-1].index
  }  
  return -1
  
}

let t = Int(readLine()!)!
for _ in 0..<t {
  let money = Int(readLine()!)! 
  let n = Int(readLine()!)!
  let costs = readLine()!.components(separatedBy: " ").map{ Int($0)! }
  var ice_creams = [IceCream]()
  
  for i in 0..<costs.count {
      var ic = IceCream(i+1,costs[i])
      ice_creams.append(ic)  
  }
  
  var sorted_ice_creams = ice_creams.sorted{ (left, right) -> Bool in
    left.cost < right.cost
  }
  
  for i in 0..<(n-1) {
    var current_index = sorted_ice_creams[i].index
    var target = money - sorted_ice_creams[i].cost
    
    if(target < 0) { continue }
      
    let subset = Array(sorted_ice_creams[0..<i]) + Array(sorted_ice_creams[(i+1)..<n])
    var start = 0
    var end = subset.count
    var target_index = binary_search(subset, start, end, target)
    
    if target_index != -1 {
      print("\(Array([current_index, target_index]).sorted().map{ String(describing: $0) }.joined(separator: " "))")
      break
    }
  }
  
}