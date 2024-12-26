// 육각형 배열 표현
let N = Int(readLine()!)!
var visited = Array(repeating: Array(repeating: false, count: 2*N+3), count: 2*N+3)
var arrow = Array(repeating: Array(repeating: 0, count: 2*N+3), count: 2*N+3)
for i in 0..<2*N+3 {
    for j in 0..<2*N+3 {
        if (i+j) % 2 != 0 {
            arrow[i][j] = 1
        }
    }
}


func adj(_ i: Int, _ j: Int) -> [(Int, Int)] {
    return [(i, j-1), (i, j+1), (arrow[i][j] == 1) ? (i-1, j) : (i+1, j)]
}

var ans = 0
func dfs(_ now: (Int, Int), _ turn: Int, _ before: (Int, Int)) {
    if turn > N {
        return
    }
    
    if visited[now.0][now.1] {
        if turn == N {
           ans += 1
        }
        return
    }
    
    visited[now.0][now.1] = true
    for a in adj(now.0, now.1) where a != before {
        dfs(a, turn+1, now)
    }
    visited[now.0][now.1] = false
    
}

visited[N+2][N+1] = true
dfs((N+1, N+1), 0, (N+2, N+1))
print(ans)
