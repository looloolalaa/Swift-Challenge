// 벨만-포드
import Foundation

let line = readLine()!.split(separator: " ").map { Int($0)! }
let (N, M) = (line[0], line[1])

var graph: [Int: [(Int, Int)]] = [:]
for _ in 0..<M {
    let li = readLine()!.split(separator: " ").map { Int($0)! }
    graph[li[0], default: []].append((li[1], li[2]))
}

let INF = Int(1e9)
var dist = Array(repeating: INF, count: N+1)

dist[1] = 0
for _ in 0..<(N-1) {
    for (s, v) in graph {
        for (e, d) in v {
            if dist[s] != INF {
                dist[e] = min(dist[e], dist[s] + d)
            }
        }
    }
}

for (s, v) in graph {
    for (e, d) in v {
        if dist[s] != INF && dist[e] > dist[s] + d {
            print(-1)
            exit(0)
        }
    }
}

for e in 2...N {
    print(dist[e] == INF ? -1 : dist[e])
}
