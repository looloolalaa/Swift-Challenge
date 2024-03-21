// 공동 순위
import Foundation

func solution(_ score:[[Int]]) -> [Int] {
    let avg = score.map { $0[0]+$0[1] }.sorted { $0 > $1 }
    var rank: [Int: Int] = [:]
    for (i, a) in avg.enumerated() {
        if rank[a] == nil {
            rank[a] = i + 1
        }
    }
    return score.map { rank[$0[0]+$0[1]]! }
}
