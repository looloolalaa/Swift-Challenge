// n! - dfs 직접 구현
import Foundation

func solution(_ k:Int, _ dungeons:[[Int]]) -> Int {
    let n = dungeons.count
    var candis: [[[Int]]] = []
    var temp: [[Int]] = Array(repeating: Array(repeating: 0, count: 2), count: n)
    var visited: [Bool] = Array(repeating: false, count: n)
    
    func dfs(_ i: Int) {
        if i == n {
            candis.append(temp)
            return
        }
        for j in (0..<n) {
            if !visited[j] {
                temp[i] = dungeons[j]
                visited[j] = true
                dfs(i+1)
                visited[j] = false
            }
        }
    }
    
    dfs(0)
    return candis.map { order in
        var (k, counter) = (k, 0)
        for o in order {
            if k < o[0] { return counter }
            else {
                k -= o[1]
                counter += 1
            }
        }
        return counter
    }.max()!
}
