// 최단 거리 + 최대 간선값
let inp = readLine()!.split(separator: " ").map { Int($0)! }
let (N, M, A, B, C) = (inp[0], inp[1], inp[2], inp[3], inp[4])

var graph = Array(repeating: [(Int, Int)](), count: N+1)
for _ in 0..<M {
    let abc = readLine()!.split(separator: " ").map { Int($0)! }
    let (a, b, c) = (abc[0], abc[1], abc[2])
    
    graph[a].append((b, c))
    graph[b].append((a, c))
}

let INF = Int(1e9)

var ans = INF
var visited = Array(repeating: false, count: N+1)
func dfs(_ i: Int, _ cash: Int, _ maxi: Int) {
    if i == B {
        ans = min(ans, maxi)
        return
    }
    
    for (j, jd) in graph[i] {
        if !visited[j] && cash >= jd {
            visited[j] = true
            dfs(j, cash - jd, max(maxi, jd))
            visited[j] = false
        }
    }
}

visited[A] = true
dfs(A, C, 0)
print(ans == INF ? -1 : ans)
