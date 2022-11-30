// arr[i][j] == set()
import Foundation

func solution(_ grid:[String]) -> [Int] {
    let height = grid.count
    let width = grid[0].count
    let dir = [(0, 1), (1, 0), (0, -1), (-1, 0)]
    
    let grid = grid.map { Array($0) }
    
    func nextNode(_ p: ((Int, Int), Int)) -> ((Int, Int), Int) {
        var now = p
        now.0 = ((now.0.0 + dir[now.1].0 + height) % height, (now.0.1 + dir[now.1].1 + width) % width)
        let nextCh = grid[now.0.0][now.0.1]
        if nextCh == "S" {
            now.1 = now.1
        } else if nextCh == "R" {
            now.1 = (now.1 + 1) % 4
        } else if nextCh == "L" {
            now.1 = (now.1 - 1 + 4) % 4
        }
        return now
    }
    
    var visited: [[Set<Int>]] = Array(repeating: Array(repeating: [], count: width), count: height)
    
    func getPathLen(_ start: (Int, Int), _ startDir: Int) -> Int {
        if visited[start.0][start.1].contains(startDir) { return -1 }
        visited[start.0][start.1].insert(startDir)
        
        var now = (start, startDir)
        var path: [((Int, Int), Int)] = [now]
        now = nextNode(now)
        while now.0 != path[0].0 || now.1 != path[0].1 {
            if visited[now.0.0][now.0.1].contains(now.1) { return -1 }
            visited[now.0.0][now.0.1].insert(now.1)
            path.append(now)
            now = nextNode(now)
        }
        return path.count
    }
    
    
    var results: [Int] = []
    for i in (0..<height) {
        for j in (0..<width) {
            for d in (0..<4) {
                let pathLen = getPathLen((i, j), d)
                if pathLen != -1 {
                    results.append(pathLen)
                }
            }
        }
    }
    
    return results.sorted()
}
