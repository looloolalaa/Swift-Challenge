// 좌표dfs (return 없는)
import Foundation

let NMH = readLine()!.split(separator: " ").map { Int($0)! }
let (N, M, H) = (NMH[0], NMH[1], NMH[2])
var table: [[Int]] = []
for _ in 0..<N {
    table.append(readLine()!.split(separator: " ").map { Int($0)! })
}

var home = (-1,-1)
var points: [(Int, Int)] = []
for i in 0..<N {
    for j in 0..<N {
        if table[i][j] == 1 {
            home = (i, j)
        } else if table[i][j] == 2 {
            points.append((i, j))
        }
    }
}

func dist(_ a: (Int, Int), _ b: (Int, Int)) -> Int {
    return abs(a.0-b.0) + abs(a.1-b.1)
}

let K = points.count
var visited = Array(repeating: false, count: K)
var ans = 0
func dfs(_ now: (Int, Int), _ hp: Int, _ milkCount: Int) {
    if dist(now, home) <= hp {
        ans = max(ans, milkCount)
        if ans == K { print(K); exit(0) }
    }
    
    for i in 0..<K {
        let di = dist(now, points[i])
        if !visited[i] && di <= hp {
            visited[i] = true
            dfs(points[i], hp-di+H, milkCount+1)
            visited[i] = false
        }
    }
}

dfs(home, M, 0)
print(ans)
