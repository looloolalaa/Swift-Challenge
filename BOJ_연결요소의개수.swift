// 그래프 connected component
let inp = readLine()!.split(separator: " ").map { Int($0)! }
let (N, M) = (inp[0], inp[1])

var graph: [Int: Set<Int>] = [:]
for _ in 0..<M {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    let (u, v) = (line[0], line[1])
    
    graph[u, default: Set<Int>()].insert(v)
    graph[v, default: Set<Int>()].insert(u)
}
var visited: [Bool] = Array(repeating: false, count: N+1)

func dfs(_ i: Int) {
    if graph[i] == nil { return }
    
    for a in graph[i]! {
        if !visited[a] {
            visited[a] = true
            dfs(a)
        }
    }
}

var res = 0
for i in 1...N {
    if !visited[i] {
        res += 1
        visited[i] = true
        dfs(i)
    }
}

print(res)
