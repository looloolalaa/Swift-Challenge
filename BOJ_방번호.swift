// 69뒤집어서 사용가능
import Foundation

let num = readLine()!
var counter: [Int: Int] = [:]
for c in num {
    var n = Int(String(c))!
    if n == 9 { n = 6 }
    counter[n, default: 0] += 1
}

let sixCount = counter[6, default: 0]
counter[6, default: 0] = (sixCount % 2 == 0) ? sixCount / 2 : sixCount / 2 + 1

print(counter.values.max()!)

