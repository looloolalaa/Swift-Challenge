// LCS 최장공통부분(수열vs문자열)
let a = Array(readLine()!)
let b = Array(readLine()!)

var dp = Array(repeating: Array(repeating: 0, count: b.count+1), count: a.count+1)

var ans = 0
for i in 0..<a.count {
    for j in 0..<b.count {
        if a[i] == b[j] {
            dp[i+1][j+1] = dp[i][j] + 1
        }
        ans = max(ans, dp[i+1][j+1])
    }
}

print(ans)
