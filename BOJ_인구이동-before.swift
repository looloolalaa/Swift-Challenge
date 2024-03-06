// 경계(벽) 저장
import Foundation

let INF = Int(1e9)
let line = readLine()!.split(separator: " ").map { Int($0)! }
let (N, L, R) = (line[0], line[1], line[2])
var arr: [[Int]] = [Array(repeating: INF, count: N+2)]
for _ in 0..<N {
    arr.append([INF] + readLine()!.split(separator: " ").map { Int($0)! } + [INF])
}
arr.append(Array(repeating: INF, count: N+2))

let dxy = [[0, 1], [1, 0], [0, -1], [-1, 0]]
func valid(_ i: Int, _ j: Int) -> Bool {
    return (0..<N)~=i && (0..<N)~=j
}

var day = 0
while true {
    var relation: [[[Bool]]] = Array(repeating: Array(repeating: [false, false, false, false], count: N), count: N)
    var hasRelation = false
    for i in 1...N {
        for j in 1...N {
            if (L...R)~=abs(arr[i][j] - arr[i][j+1]) {
                relation[i-1][j-1][0] = true
                hasRelation = true
            }
            if (L...R)~=abs(arr[i][j] - arr[i+1][j]) {
                relation[i-1][j-1][1] = true
                hasRelation = true
            }
            if (L...R)~=abs(arr[i][j] - arr[i][j-1]) {
                relation[i-1][j-1][2] = true
                hasRelation = true
            }
            if (L...R)~=abs(arr[i][j] - arr[i-1][j]) {
                relation[i-1][j-1][3] = true
                hasRelation = true
            }
        }
    }
    
    if !hasRelation { break }
    
    var connect: [[Int]] = []
    func dfs(_ i: Int, _ j: Int) {
        connect.append([i, j])
        for d in 0..<4 {
            let (a, b) = (i+dxy[d][0], j+dxy[d][1])
            if valid(a, b) && !visited[a][b] && relation[i][j][d] {
                visited[a][b] = true
                dfs(a, b)
            }
        }
    }
    
    var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: N), count: N)
    for i in 0..<N {
        for j in 0..<N {
            if !visited[i][j] {
                visited[i][j] = true
                connect = []
                dfs(i, j)
                let newNum = connect.map { arr[$0[0]+1][$0[1]+1] }.reduce(0, +) / connect.count
                for ab in connect {
                    arr[ab[0]+1][ab[1]+1] = newNum
                }
            }
        }
    }
    
    day += 1
}

print(day)



