import Foundation;
let line1 = readLine()!.components(separatedBy: [" "])
let n = Int(line1[0])!
let k = Int(line1[1])!
let array = readLine()!.components(separatedBy: [" "])
print("\(Array(array[k ..< n] + array[0 ..< k]).joined(separator: " "))")
