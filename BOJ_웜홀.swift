// 벨만-포드
let INF = Int(1e9)
let TC = Int(readLine()!)!
for _ in 0..<TC {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    let (N, M, W) = (line[0], line[1], line[2])
    
    var edges: [[Int]] = []
    for _ in 0..<M {
        let line = readLine()!.split(separator: " ").map { Int($0)! }
        let (s, e, d) = (line[0], line[1], line[2])
        edges.append([s, e, d])
        edges.append([e, s, d])
    }
    for _ in 0..<W {
        let line = readLine()!.split(separator: " ").map { Int($0)! }
        let (s, e, d) = (line[0], line[1], line[2])
        edges.append([s, e, -d])
    }
    
    var dist = Array(repeating: 0, count: N+1)
    func hasCycle() -> Bool {
        for _ in 0..<(N-1) {
            for edge in edges {
                let (s, e, d) = (edge[0], edge[1], edge[2])
                if dist[s] != INF {
                    dist[e] = min(dist[e], dist[s] + d)
                }
            }
        }
        
        for edge in edges {
            let (s, e, d) = (edge[0], edge[1], edge[2])
            if dist[s] != INF && dist[e] > dist[s] + d {
                return true
            }
        }
        return false
    }

    print(hasCycle() ? "YES" : "NO")
}


