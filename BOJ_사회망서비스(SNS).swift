// 트리 dp
let N = Int(readLine()!)!
var tree = Array(repeating: [Int](), count: N+1)

for _ in 0..<N-1 {
    let uv = readLine()!.split(separator: " ").map { Int($0)! }
    let (u, v) = (uv[0], uv[1])
    
    tree[u].append(v)
    tree[v].append(u)
}

var visited = Array(repeating: false, count: N+1)
var dp = Array(repeating: [-1,-1], count: N+1)
func dfs(_ node: Int) {
    let children = tree[node].filter { !visited[$0] }
    if children.isEmpty {
        dp[node] = [0, 1]
        return
    }
    
    for a in children {
        visited[a] = true
        dfs(a)
        visited[a] = false
    }
    
    dp[node][0] = children.map { dp[$0][1] }.reduce(0,+)
    dp[node][1] = children.map { dp[$0].min()! }.reduce(1,+)
    
}

visited[1] = true
dfs(1)

print(dp[1].min()!)


