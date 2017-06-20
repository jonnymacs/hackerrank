import Foundation;
let line = readLine()!.components(separatedBy: " ")
let m = Int(line[0])!
let n = Int(line[1])!

let magazine_words = Array(readLine()!.components(separatedBy: " "))
let ransom_words = Array(readLine()!.components(separatedBy: " "))

var magazine_hsh = [String:Int]()
for word in magazine_words {
  if magazine_hsh[word] == nil {
    magazine_hsh[word] = 0
  }
  magazine_hsh[word] = magazine_hsh[word]! + 1
}
var can_do = true
for word in ransom_words {
  if magazine_hsh[word] != nil && magazine_hsh[word]! > 0 {
    magazine_hsh[word] = magazine_hsh[word]! - 1
  } else {
    can_do = false
    break
  }
}
var out = can_do ? "Yes" : "No"
print("\(out)")
