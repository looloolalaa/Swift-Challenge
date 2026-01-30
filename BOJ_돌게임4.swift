// 돌 다 가져가도 지면
var dp = Array(repeating: true, count: 1001)
dp[1] = false
dp[3] = false

for i in 5...1000 {
    if dp[i-1] && dp[i-3] && dp[i-4] {
        dp[i] = false
    }
}

let N = Int(readLine()!)!
print(dp[N] ? "SK" : "CY")
