// 팰린드롬 조건
import Foundation

let str = readLine()!
var counter: [Character: Int] = [:]
for c in str {
    counter[c, default: 0] += 1
}

let val = counter.values
if !val.allSatisfy({ $0 % 2 == 0 }) && val.filter({ $0 % 2 == 1 }).count != 1 {
    print("I'm Sorry Hansoo")
    exit(0)
}

var center = ""
for (k, v) in counter {
    if v % 2 == 1 {
        center = String(k)
    }
}

var res = ""
for k in counter.keys.sorted() {
    res += String(repeating: k, count: counter[k]! / 2)
}
let rev = res.reversed()
print(res + center + rev)
