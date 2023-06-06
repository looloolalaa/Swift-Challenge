// 공동 순위 매기기
import Foundation

func solution(_ score:[[Int]]) -> [Int] {
    let score = score.map { $0.reduce(0, +) }
    let order = score.sorted { $0 > $1 }
    
    var result: [Int] = []
    for i in 0..<score.count {
        result.append(order.firstIndex(of: score[i])! + 1)
    }
    
    return result
}
