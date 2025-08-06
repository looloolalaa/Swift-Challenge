// 제곱수 dp
let N = Int(readLine()!)!

var dp = Array(repeating: N, count: N+1)
dp[0] = 0

for i in 0..<N {
    let now = dp[i]
    var j = 1
    while i + j*j <= N {
        dp[i + j*j] = min(dp[i + j*j], now + 1)
        j += 1
    }
}

print(dp[N])
