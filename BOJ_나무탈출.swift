// 그래프에서 리프노드 찾기
let N = Int(readLine()!)!
var tree = Array(repeating: [Int](), count: N+1)

for _ in 0..<N-1 {
    let ab = readLine()!.split(separator: " ").map { Int($0)! }
    let (a, b) = (ab[0], ab[1])
    
    tree[a].append(b)
    tree[b].append(a)
}

var total = 0
var visited = Array(repeating: false, count: N+1)
func dfs(_ node: Int, _ depth: Int) {
    let children = tree[node].filter { !visited[$0] }
    if children.isEmpty {
        total += depth
        return
    } else {
        for child in children {
            visited[child] = true
            dfs(child, depth+1)
            visited[child] = false
        }
    }
}

visited[1] = true
dfs(1, 0)

print(total % 2 == 0 ? "No" : "Yes")
