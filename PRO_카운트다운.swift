// 최소 동전 개수로 금액을 맞추는 방법
// 8원을 맞춰야하고 수중에 1,4,5 짜리 동전이 많이 있다면?
import Foundation

func solution(_ target:Int) -> [Int] {
    let len = target + 1
    var targets: [(Int, Int)] = Array(repeating: (len + 1, -1), count: len)
    var scores: [Int: Bool] = [50: true]
    
    targets[0] = (0, 0)
    for mul in stride(from: 3, to: 0, by: -1) {
        for s in stride(from: 20, to: 0, by: -1) {
            scores[s * mul] = (mul == 1) ? true : false
            if s * mul < len {
                targets[s * mul] = (mul == 1) ? (1, 1) : (1, 0)
            }
        }
    }
    
    for i in 0..<len {
        for (score, single) in scores {
            let next = i + score
            if next < len {
                let news = (targets[i].0 + 1, targets[i].1 + (single ? 1 : 0))
                if targets[next].0 > news.0 {
                    targets[next] = news
                } else if targets[next].0 == news.0 && targets[next].1 < news.1 {
                    targets[next] = news
                }
            }
        }
    }
    
    let result = targets[target]
    return [result.0, result.1]
}
