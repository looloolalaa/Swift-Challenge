// 유니온-파인드
import Foundation

let N = Int(readLine()!)!
let M = Int(readLine()!)!
var graph: [[Int]] = []
for _ in 0..<N {
    graph.append(readLine()!.split(separator: " ").map { Int($0)! })
}
let wanted = readLine()!.split(separator: " ").map { Int($0)!-1 }

var parent = Array(0..<N)
func root(_ a: Int) -> Int {
    if parent[a] != a {
        parent[a] = root(parent[a])
    }
    return parent[a]
}

for a in 0..<N {
    for b in 0..<N {
        if graph[a][b] == 1 {
            let (rootA, rootB) = (root(a), root(b))
            if rootA != rootB {
                parent[rootB] = rootA
            }
        }
    }
}

let first = root(wanted[0])
for w in wanted[1...] {
    if root(w) != first {
        print("NO")
        exit(0)
    }
}

print("YES")
