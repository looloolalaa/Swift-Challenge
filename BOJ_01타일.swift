// 타일 dp
let N = Int(readLine()!)!
var dp = Array(repeating: 0, count: N+1)
dp[0] = 1
dp[1] = 1

for i in 2..<N+1 {
    dp[i] = (dp[i-1] + dp[i-2]) % 15746
}

print(dp[N])
