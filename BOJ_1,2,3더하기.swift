// 작은 숫자부터 규칙성 찾기
var dp = Array(repeating: 0, count: 11)
dp[1] = 1
dp[2] = 2
dp[3] = 4

for i in 4...10 {
    dp[i] = dp[i-1] + dp[i-2] + dp[i-3]
}

let T = Int(readLine()!)!
for _ in 0..<T {
    let n = Int(readLine()!)!
    print(dp[n])
}
