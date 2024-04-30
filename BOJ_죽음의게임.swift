// 더게임오브데스
import Foundation

let line = readLine()!.split(separator: " ").map { Int($0)! }
let (N, K) = (line[0], line[1])
var arr = Array(repeating: -1, count: N)
for i in 0..<N {
    arr[i] = Int(readLine()!)!
}

var s = Set<Int>([0])
var now = 0
var M = 0
while true {
    let nxt = arr[now]
    if nxt == K { break }
    if s.contains(nxt) {
        print(-1)
        exit(0)
    }
    
    s.insert(nxt)
    now = nxt
    M += 1
}

print(M + 1)
