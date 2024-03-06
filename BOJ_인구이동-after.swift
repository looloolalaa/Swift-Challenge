// dfs를 하면서 조건 탐색
import Foundation

let line = readLine()!.split(separator: " ").map { Int($0)! }
let (N, L, R) = (line[0], line[1], line[2])
var arr: [[Int]] = []
for _ in 0..<N {
    arr.append(readLine()!.split(separator: " ").map { Int($0)! })
}

let dxy = [[0, 1], [1, 0], [0, -1], [-1, 0]]
func valid(_ i: Int, _ j: Int) -> Bool {
    return (0..<N)~=i && (0..<N)~=j
}

var day = 0
while true {
    var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: N), count: N)
    var connect: [(Int, Int)] = []
    func dfs(_ i: Int, _ j: Int) {
        for d in dxy {
            let (a, b) = (i+d[0], j+d[1])
            if valid(a, b) && !visited[a][b] && (L...R)~=abs(arr[i][j] - arr[a][b]) {
                visited[a][b] = true
                connect.append((a, b))
                dfs(a, b)
            }
        }
    }
    
    var hasMove = false
    for i in 0..<N {
        for j in 0..<N {
            if !visited[i][j] {
                visited[i][j] = true
                connect = [(i, j)]
                dfs(i, j)
                if connect.count > 1 { hasMove = true }
                
                let newNum = connect.map { arr[$0][$1] }.reduce(0, +) / connect.count
                for (a, b) in connect {
                    arr[a][b] = newNum
                }
            }
        }
    }
    
    if !hasMove { break }
    day += 1
}


print(day)
