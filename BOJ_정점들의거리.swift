// LCA 응용
import Foundation

let N = Int(readLine()!)!
var graph: [Int: [(Int, Int)]] = [:]
for _ in 0..<(N-1) {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    let (a, b, c) = (line[0], line[1], line[2])
    graph[a, default: []].append((b, c))
    graph[b, default: []].append((a, c))
}

let maxHeight = Int(log2(Double(N)))+1
var depth = Array(repeating: -1, count: N+1)
var parent = Array(repeating: Array(repeating: 0, count: maxHeight), count: N+1)
var dist = Array(repeating: -1, count: N+1)

func dfs(_ x: Int) {
    for (a, ad) in graph[x, default: []] {
        if depth[a] == -1 {
            dist[a] = dist[x] + ad
            depth[a] = depth[x] + 1
            parent[a][0] = x
            for i in 1..<maxHeight {
                parent[a][i] = parent[parent[a][i-1]][i-1]
            }
            dfs(a)
        }
    }
}

dist[1] = 0
depth[1] = 0
dfs(1)

func lca(_ a: Int, _ b: Int) -> Int {
    var (a, b) = (a, b)
    if depth[a] < depth[b] { (a, b) = (b, a) }
    
    for k in (0..<maxHeight).reversed() {
        if depth[parent[a][k]] >= depth[b] {
            a = parent[a][k]
        }
    }

    if a == b { return a }
    for k in (0..<maxHeight).reversed() {
        if parent[a][k] != parent[b][k] {
            a = parent[a][k]
            b = parent[b][k]
        }
    }
    return parent[a][0]
}

let M = Int(readLine()!)!
for _ in 0..<M {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    let (a, b) = (line[0], line[1])
    
    print(dist[a] + dist[b] - 2 * dist[lca(a, b)])
}
