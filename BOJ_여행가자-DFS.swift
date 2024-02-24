// parent DFS
import Foundation

let N = Int(readLine()!)!
let M = Int(readLine()!)!
var graph: [[Int]] = []
for _ in 0..<N {
    graph.append(readLine()!.split(separator: " ").map { Int($0)! })
}
let wanted = readLine()!.split(separator: " ").map { Int($0)!-1 }

var parent = Array(repeating: -1, count: N)

func dfs(_ a: Int, _ p: Int) {
    for b in 0..<N {
        if graph[a][b] == 1 && parent[b] == -1 {
            parent[b] = p
            dfs(b, p)
        }
    }
}

for i in 0..<N {
    if parent[i] == -1 {
        parent[i] = i
        dfs(i, i)
    }
}

let first = parent[wanted[0]]
for w in wanted[1...] {
    if parent[w] != first {
        print("NO")
        exit(0)
    }
}
print("YES")
