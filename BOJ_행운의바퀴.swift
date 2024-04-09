// 음수 회전
import Foundation

let line = readLine()!.split(separator: " ").map { Int($0)! }
let (N, K) = (line[0], line[1])
var arr = Array(repeating: "?", count: N)

var s = Set<String>()
var i = 0
for _ in 0..<K {
    let li = readLine()!.components(separatedBy: " ")
    let (d, ch) = (Int(li[0])!, li[1])
    i = (i-d+N*100)%N
    if arr[i] == "?" {
        if s.contains(ch) { print("!"); exit(0) }
        arr[i] = ch
        s.insert(ch)
    } else if arr[i] != ch {
        print("!"); exit(0)
    }
}

for _ in 0..<N {
    print(arr[i], terminator: "")
    i = (i+1)%N
}
