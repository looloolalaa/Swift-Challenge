// 돌을 다 빼봐도 상대가 이기면
let N = Int(readLine()!)!
var dp = Array(repeating: 0, count: 1001)
dp[1] = 1
dp[3] = 1
dp[4] = 1

for i in 5...1000 {
    if dp[i-1]==1 && dp[i-3]==1 && dp[i-4]==1 {
        dp[i] = 0
    } else {
        dp[i] = 1
    }
}

print(dp[N] == 1 ? "SK" : "CY")

