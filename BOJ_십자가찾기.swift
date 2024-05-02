// 만들수있는십자가 방문
import Foundation

let line = readLine()!.split(separator: " ").map { Int($0)! }
let (N, M) = (line[0], line[1])
var arr: [[Character]] = []
for _ in 0..<N {
    arr.append(Array(readLine()!))
}

let dxy = [[0, 1], [1, 0], [0, -1], [-1, 0]]
func valid(_ i: Int, _ j: Int) -> Bool {
    return (0..<N)~=i && (0..<M)~=j
}
func len(_ i: Int, _ j: Int) -> Int {
    var d = 1
    while true {
        if [(i, j+d), (i+d, j), (i,j-d), (i-d,j)].allSatisfy({ valid($0,$1) && arr[$0][$1] == "*" }) {
            d += 1
        } else {
            break
        }
    }
    return d-1
}


var visited = Array(repeating: Array(repeating: false, count: M), count: N)

var res: [[Int]] = []
for i in 0..<N {
    for j in 0..<M {
        if arr[i][j] == "*" {
            let le = len(i, j)
            if le >= 1 {
                res.append([i+1, j+1, le])
                for k in 0...le {
                    visited[i][j+k] = true
                    visited[i+k][j] = true
                    visited[i][j-k] = true
                    visited[i-k][j] = true
                }
            }
        }
    }
}

for i in 0..<N {
    for j in 0..<M {
        if arr[i][j] == "*" && !visited[i][j] {
            print(-1)
            exit(0)
        }
    }
}

print(res.count)
for r in res {
    print(r.map { String($0) }.joined(separator: " "))
}
