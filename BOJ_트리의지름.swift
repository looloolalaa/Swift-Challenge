// 트리 DFS
import Foundation

let V = Int(readLine()!)!
var visited: [Bool] = Array(repeating: false, count: V+1)
var dist: [Int] = Array(repeating: 0, count: V+1)
var tree: [Int: [Int: Int]] = [:]

for _ in 0..<V {
    let line = readLine()!.components(separatedBy: " ").map { Int($0)! }
    let v = line[0]
    for i in stride(from: 1, to: line.count-2, by: 2) {
        tree[v, default: [:]][line[i]] = line[i+1]
    }
}

func dfs(_ v: Int, _ d: Int) {
    for (a, ad) in tree[v, default: [:]] {
        if !visited[a] {
            visited[a] = true
            dist[a] = d + ad
            dfs(a, d+ad)
        }
    }
}

visited[2] = true
dfs(2, 0)

let end = (1...V).max { dist[$0] < dist[$1] }!

for i in 1...V {
    visited[i] = false
    dist[i] = 0
}

visited[end] = true
dfs(end, 0)

print(dist.max()!)

