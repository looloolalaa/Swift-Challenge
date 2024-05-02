import Foundation

func solution(_ n:Int, _ costs:[[Int]]) -> Int {
    let costs = costs.sorted { $0[2] < $1[2] }
    
    var parent = Array(0..<n)
    func root(_ a: Int) -> Int {
        if parent[a] != a {
            parent[a] = root(parent[a])
        }
        return parent[a]
    }
    
    var res = 0
    for cost in costs {
        let (a, b, c) = (cost[0], cost[1], cost[2])
        
        let (rootA, rootB) = (root(a), root(b))
        if rootA == rootB { continue }
        
        res += c
        parent[rootB] = rootA
    }
    
    return res
}
