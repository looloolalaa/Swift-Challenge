// 두 점 (0,0) (5,5)에서 동시 출발
var visited = Array(repeating: Array(repeating: false, count: 5), count: 5)

let K = Int(readLine()!)!
for _ in 0..<K {
    let p = readLine()!.split(separator: " ").map { Int($0)!-1 }
    visited[p[0]][p[1]] = true
}

let dxy = [[0,1], [1,0], [0,-1], [-1,0]]
func valid(_ i: Int, _ j: Int) -> Bool {
    return (0..<5)~=i && (0..<5)~=j
}


var ans = 0
func dfs(_ i: Int, _ j: Int, _ visitedCount: Int) {
    if i == 4 && j == 4 {
        if visitedCount == 25-K { ans += 1 }
        return
    }
    
    for d in dxy {
        let (a, b) = (i+d[0], j+d[1])
        if valid(a, b) && !visited[a][b] {
            visited[a][b] = true
            dfs(a, b, visitedCount+1)
            visited[a][b] = false
        }
    }
}

visited[0][0] = true
dfs(0, 0, 1)
print(ans)
