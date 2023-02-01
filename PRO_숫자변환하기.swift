// 최소 횟수 DP
import Foundation

func solution(_ x:Int, _ y:Int, _ n:Int) -> Int {
    let inf = 99999999
    var counter: [Int: Int] = [x: 0]
    for i in x...1000000 {
        if let c = counter[i] {
            counter[i + n] = min(counter[i + n, default: inf], c + 1)
            counter[i * 2] = min(counter[i * 2, default: inf], c + 1)
            counter[i * 3] = min(counter[i * 3, default: inf], c + 1)
        }
    }
    return counter[y] ?? -1
}
