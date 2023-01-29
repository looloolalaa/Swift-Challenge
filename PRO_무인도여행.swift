// 2차원 배열 탐색
import Foundation

func solution(_ maps:[String]) -> [Int] {
    let maps = maps.map { Array($0) }
    var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: maps[0].count), count: maps.count)
    
    func valid(_ x: Int, _ y: Int) -> Bool {
        return 0 <= x && x < maps.count && 0 <= y && y < maps[0].count
    }
    
    let dxy = [[0, 1], [1, 0], [-1, 0], [0, -1]]
    func sum(_ x: Int, _ y: Int) -> Int {
        if !valid(x, y) || visited[x][y] || maps[x][y] == "X" {
            return 0
        }
        
        visited[x][y] = true
        var s = Int(String(maps[x][y]))!
        for d in dxy {
            let (a, b) = (x+d[0], y+d[1])
            s += sum(a, b)
        }
        return s
    }
    
    var result: [Int] = []
    for i in 0..<maps.count {
        for j in 0..<maps[0].count {
            if maps[i][j] != "X" && !visited[i][j] {
                result.append(sum(i, j))
            }
        }
    }
    
    return result.isEmpty ? [-1] : result.sorted()
}
