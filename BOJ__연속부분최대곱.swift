// 카데인 알고리즘 - 연속부분의 최대합곱
import Foundation

let N = Int(readLine()!)!
var dp = Array(repeating: 0.0, count: N+1)

for i in 1...N {
    let n = Double(readLine()!)!
    dp[i] = max(dp[i-1] * n, n)
}

print(String(format: "%.3f", dp.max()!))



