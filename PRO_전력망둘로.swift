// graph: defaultdict set & dfsCount
import Foundation

func solution(_ n:Int, _ wires:[[Int]]) -> Int {
    var graph: [Int: Set<Int>] = [:]
    for wire in wires {
        let (s, e) = (wire[0], wire[1])
        graph[s, default: []].insert(e)
        graph[e, default: []].insert(s)
    }
    var visited: [Bool] = Array(repeating: false, count: n+1)
    
    func dfsCount(_ n: Int) -> Int {
        if visited[n] { return 0 }
        visited[n] = true
        return 1 + graph[n]!.reduce(0) { $0 + dfsCount($1) }
    }
    
    var diffs: [Int] = []
    for wire in wires {
        let (s, e) = (wire[0], wire[1])
        graph[s]!.remove(e)
        graph[e]!.remove(s)
        
        let first = dfsCount(s)
        let second = n - first
        let diff = abs(first - second)
        diffs.append(diff)
        
        graph[s]!.insert(e)
        graph[e]!.insert(s)
        visited = Array(repeating: false, count: n+1)
    }
    return diffs.min()!
}
