// 확률 이동 (2N+1)
let line = readLine()!.split(separator: " ").map { Int($0)! }
let N = line[0]
let percent = line[1...].map { Double($0)/100 }
var visited = Array(repeating: Array(repeating: false, count: 2*N+1), count: 2*N+1)

let dxy = [[0,1],[0,-1],[1,0],[-1,0]]

var ans = 0.0
func dfs(_ depth: Int, _ i: Int, _ j: Int, _ p: Double) {
    if depth == N {
        ans += p
        return
    }
    
    for d in 0..<4 {
        let (a, b) = (i+dxy[d][0], j+dxy[d][1])
        if !visited[a][b] {
            visited[a][b] = true
            dfs(depth+1, a, b, p*percent[d])
            visited[a][b] = false
        }
    }
}

visited[N][N] = true
dfs(0, N, N, 1)

print(ans)
