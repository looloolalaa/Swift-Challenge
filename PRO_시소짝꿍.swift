// 쌍: O(N) using Counter
import Foundation

func solution(_ weights:[Int]) -> Int64 {
    var result = 0
    var counter: [Double: Int] = [:]
    
    for w in weights {
        counter[Double(w), default: 0] += 1
    }
    
    let candis: [Double] = [2/3, 2/4, 3/2, 3/4, 4/2, 4/3]
    for (key, value) in counter {
        result += value * (value - 1)
        for c in candis {
            if let oppo = counter[key * c] {
                result += value * oppo
            }
        }
    }
    return Int64(result) / 2
}
