// min(func, func)
import Foundation

func solution(_ storey:Int) -> Int {
    func minStone(_ s: Int) -> Int {
        if s < 10 { return min(s, 10-s+1) }

        let n = s % 10
        return min(n + minStone(s/10), (10-n) + minStone(s/10 + 1))
    }

    return minStone(storey)
}
