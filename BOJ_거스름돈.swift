// 동전 개수 최소
let INF = Int(1e9)
let n = Int(readLine()!)!
var dp = Array(repeating: INF, count: n+1)
dp[0] = 0

for i in 0..<n {
    if i+2 <= n {
        dp[i+2] = min(dp[i+2], dp[i]+1)
    }
    if i+5 <= n {
        dp[i+5] = min(dp[i+5], dp[i]+1)
    }
}

print(dp[n] == INF ? -1 : dp[n])
