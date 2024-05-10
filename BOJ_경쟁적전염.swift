// 맨해튼 거리 n인 지점들
import Foundation

func valid(_ ij: [Int]) -> Bool {
    return (0..<N)~=ij[0] && (0..<N)~=ij[1]
}

func around(_ i: Int, _ j: Int, _ s: Int) -> [[Int]] {
    var res: [[Int]] = []
    for dy in -s...s {
        let d = s-abs(dy)
        res.append([i+dy, j-d])
        res.append([i+dy, j+d])
    }
    return res.filter { valid($0) }
}

let line = readLine()!.split(separator: " ").map { Int($0)! }
let (N, K) = (line[0], line[1])
var arr: [[Int]] = []
for _ in 0..<N {
    arr.append(readLine()!.split(separator: " ").map { Int($0)! })
}
let SXY = readLine()!.split(separator: " ").map { Int($0)! }
let (S, X, Y) = (SXY[0], SXY[1], SXY[2])

for d in 0...S {
    let virus = around(X-1, Y-1, d).map { arr[$0[0]][$0[1]] }.filter { $0 != 0 }
    if !virus.isEmpty {
        print(virus.min()!)
        exit(0)
    }
}
print(0)
