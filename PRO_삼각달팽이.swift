// 3 directions
import Foundation

func solution(_ n:Int) -> [Int] {
    var table: [[Int]] = []
    for i in (1...n) {
        table.append(Array(repeating: 0, count: i))
    }
    
    func isWall(_ p: (Int, Int)) -> Bool {
        // is not valid pos || not zero
        return !(0 <= p.0 && p.0 < n && 0 <= p.1 && p.1 <= p.0) || table[p.0][p.1] != 0
    }
    
    let dxy = [(1, 0), (0, 1), (-1, -1)]
    var d = 0
    var now = (0, 0)
    for num in (1...n*(n+1)/2) {
        table[now.0][now.1] = num
        var nextNow = (now.0 + dxy[d].0, now.1 + dxy[d].1)
        if isWall(nextNow) {
            d = (d + 1) % 3
            nextNow = (now.0 + dxy[d].0, now.1 + dxy[d].1)
        }
        now = nextNow
    }
    
    return table.reduce([], +)
}
