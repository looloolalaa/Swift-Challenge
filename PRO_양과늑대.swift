// tree GO & keep State
import Foundation

func solution(_ info:[Int], _ edges:[[Int]]) -> Int {
    var graph: [Int: [Int]] = [:]
    for e in edges {
        graph[e[0], default: []].append(e[1])
    }
    
    var result = 1
    func go(_ n: Int, _ canGo: Set<Int>, _ sheep: Int, _ wolf: Int) {
        var (sheep, wolf) = (sheep, wolf)
        if info[n] == 0 { sheep += 1 } else { wolf += 1 }
        
        if wolf >= sheep { return }
        result = max(result, sheep)
        
        var canGo = canGo
        if let children = graph[n] {
            for child in children {
                canGo.insert(child)
            }
        }
        
        for can in canGo {
            var newGo = canGo
            newGo.remove(can)
            go(can, newGo, sheep, wolf)
        }
    }
    
    go(0, Set<Int>(), 0, 0)
    return result
}
