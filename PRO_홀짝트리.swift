// 트리의 노드들의 자식노드의 개수
import Foundation

func solution(_ nodes:[Int], _ edges:[[Int]]) -> [Int] {
    var graph: [Int: [Int]] = [:]
    for edge in edges {
        let (a, b) = (edge[0], edge[1])
        graph[a, default: []].append(b)
        graph[b, default: []].append(a)
    }
    
    
    var visited = Set<Int>()
    var oneGraph: [Int] = []
    func dfs(_ node: Int) {
        for a in graph[node, default: []] {
            if !visited.contains(a) {
                oneGraph.append(a)
                visited.insert(a)
                dfs(a)
            }
        }
    }
    
    func redBlueCount(_ nodes: [Int]) -> (Int, Int) {
        var (red, blue) = (0, 0)
        for node in nodes {
            let childCount = graph[node, default: []].count - 1
            if (node%2==0 && childCount%2==0) || (node%2==1 && childCount%2==1) {
                blue += 1
            } else {
                red += 1
            }
        }
        return (red, blue)
    }
    
    var ans = [0, 0]
    for node in nodes {
        if !visited.contains(node) {
            visited.insert(node)
            oneGraph = [node]
            dfs(node)
            
            let (red, blue) = redBlueCount(oneGraph)
            if red == 1 { ans[0] += 1 }
            if blue == 1 { ans[1] += 1 }
        }
    }
    
    return ans
}

// -1
// l

// 0 1 0
// l r l

// 0 1 1 0
// r r l r

// 0 1 1 0
// l l r r

