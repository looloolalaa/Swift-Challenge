//pow
import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (A, P) = (input[0], input[1])

var D: [Int] = [A]
var s: Set<Int> = Set([A])

while true {
    let next_val: Int = String(D.last!).reduce(0) { $0 + pow($1.wholeNumberValue!, P) }
    
    if s.contains(next_val) {
        print(D.firstIndex(of: next_val)!)
        break
    }
    D.append(next_val)
    s.insert(next_val)
}


func pow(_ a: Int, _ b: Int) -> Int {
    return Int(pow(Double(a), Double(b)))
}

