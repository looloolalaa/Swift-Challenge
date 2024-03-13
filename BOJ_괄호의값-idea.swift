// 분배 법칙
import Foundation

let str = Array(readLine()!).map { String($0) }
var stack: [String] = []
var temp = 1
var res = 0

let val = ["(": 2, "[": 3]
let pair = [")": "(", "]": "["]
for i in 0..<str.count {
    let c = str[i]
    if c == "(" || c == "[" {
        temp *= val[c]!
        stack.append(c)
    } else {
        if stack.isEmpty || stack.last! != pair[c]! {
            print(0); exit(0)
        } else {
            if str[i-1] == pair[c]! { res += temp }
            temp /= val[stack.removeLast()]!
        }
    }
}

print(stack.isEmpty ? res : 0)
