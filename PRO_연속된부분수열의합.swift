// 투 포인터 - 구간 합
import Foundation

func solution(_ sequence:[Int], _ k:Int) -> [Int] {
    var result = [0, sequence.count]
    
    var (s, e) = (0, 0)
    var sum = sequence[0]
    while s < sequence.count {
        if sum == k {
            if (result[1] - result[0]) > (e - s) {
                result = [s, e]
            }
            sum -= sequence[s]
            s += 1
        } else if sum < k {
            e += 1
            if e >= sequence.count { break }
            sum += sequence[e]
        } else {
            sum -= sequence[s]
            s += 1
        }
    }
    
    return result
}
