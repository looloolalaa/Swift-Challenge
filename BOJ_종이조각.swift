// 자를 수 있는 경우를 dfs로 탐색
let NM = readLine()!.split(separator: " ").map { Int($0)! }
let (N, M) = (NM[0], NM[1])
var table: [[Character]] = []
for _ in 0..<N {
    table.append(Array(readLine()!))
}
var visited = Array(repeating: Array(repeating: false, count: M), count: N)

var ans = 0
func dfs(_ p: Int, _ s: Int) {
    if p == N*M {
        ans = max(ans, s)
        return
    }
    
    let (a, b) = (p/M, p%M)
    if visited[a][b] {
        dfs(p+1, s)
    } else {
        var (i, j) = (a, b)
        var str = ""
        while j < M && !visited[i][j] {
            str += "\(table[i][j])"
            visited[i][j] = true
            dfs(p+1, s + Int(str)!)
            j += 1
        }
        for k in b..<j {
            visited[i][k] = false
        }
        
        (i, j) = (a+1, b)
        str = "\(table[a][b])"
        while i < N && !visited[i][j] {
            str += "\(table[i][j])"
            visited[i][j] = true
            dfs(p+1, s + Int(str)!)
            i += 1
        }
        for k in a..<i {
            visited[k][j] = false
        }
    }
}


dfs(0, 0)
print(ans)
