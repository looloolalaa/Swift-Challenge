// 구간 부분합 최대: O(N)
// dp[i] => arr[i]이 오른쪽 끝인 수열의 최대합
// == (dp[i-1]에 arr[i]가 추가되는 경우 vs arr[i] 혼자만이 최대인 경우)
import Foundation

func solution(_ sequence:[Int]) -> Int64 {
    let n = sequence.count
    let initial = Array(repeating: 0, count: n)
    var (a, b, dp) = (initial, initial, initial)
    
    for i in 0..<n {
        let now = (i % 2 == 0) ? sequence[i] : -sequence[i]
        a[i] = now
        b[i] = -now
    }
    
    
    
    dp[0] = a[0]
    for i in 1..<n {
        dp[i] = max(dp[i-1] + a[i], a[i])
    }
    
    var result = dp.max()!
    
    dp[0] = b[0]
    for i in 1..<n {
        dp[i] = max(dp[i-1] + b[i], b[i])
    }
    
    result = max(result, dp.max()!)
    return Int64(result)
}


// [-2, 3, 9, 10, 7, 6, 4, 8]
