// slow Dijkstra
import Foundation

func solution(_ N:Int, _ road:[[Int]], _ k:Int) -> Int {
    var graph: [Int: [Int: Int]] = [:]
    for r in road {
        graph[r[0], default: [:]][r[1]] = min(graph[r[0], default: [:]][r[1]] ?? 10001 * 2000, r[2])
        graph[r[1], default: [:]][r[0]] = min(graph[r[1], default: [:]][r[0]] ?? 10001 * 2000, r[2])
    }
    var dis: [Int] = Array(repeating: 10001 * 2000, count: N + 1)
    var visited = Set<Int>()
    
    dis[1] = 0
    while visited.count < N {
        let minNode = (1...N).filter { !visited.contains($0) }.min() { dis[$0] < dis[$1] }!
        visited.insert(minNode)
        
        for a in graph[minNode]!.keys {
            dis[a] = min(dis[a], dis[minNode] + graph[minNode]![a]!)
        }
    }
    // print(dis)
    return dis.filter { $0 <= k }.count
}
