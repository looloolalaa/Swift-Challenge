// 합표현 대칭 1+a+1 2+b+2
var dp = Array(repeating: 0, count: 100_001)
dp[1] = 1
dp[2] = 2
dp[3] = 2
dp[4] = 3
dp[5] = 3
dp[6] = 6

for i in 7...100_000 {
    dp[i] = (dp[i-2] + dp[i-4] + dp[i-6]) % 1_000_000_009
}

for _ in 0..<Int(readLine()!)! {
    let n = Int(readLine()!)!
    print(dp[n])
}

