// 오른쪽에 붙이기
import Foundation

let NM = readLine()!.split(separator: " ").map { Int($0)! }
let (N, M) = (NM[0], NM[1])

if N < M {
    print(1)
    exit(0)
}

var dp = Array(repeating: 0, count: N+1)

for i in 0..<M {
    dp[i] = 1
}

for i in M...N {
    dp[i] = (dp[i-1] + dp[i-M]) % 1_000_000_007
}


print(dp[N])

