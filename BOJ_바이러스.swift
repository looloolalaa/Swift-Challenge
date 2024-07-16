// graph dfs 순서
let N = Int(readLine()!)!
let M = Int(readLine()!)!

var graph: [Int: Set<Int>] = [:]
for _ in 0..<M {
    let inp = readLine()!.split(separator: " ").map { Int($0)! }
    let (a, b) = (inp[0], inp[1])

    graph[a, default: Set<Int>()].insert(b)
    graph[b, default: Set<Int>()].insert(a)
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

visited[1] = true
dfs(1)
print(visited.filter { $0 == true }.count - 1)

