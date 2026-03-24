// 피라미드 범위 dp
let MN = readLine()!.split(separator: " ").map { Int($0)! }
let (M, N) = (MN[0], MN[1])

var D: [[Int]] = []
for _ in 0..<M {
    D.append(Array(readLine()!).map { Int(String($0))! })
}

var dp = Array(repeating: Array(repeating: 0, count: N), count: M+2)

for j in 0..<N-1 {
    for i in 1...M {
        dp[i][j] += D[i-1][j]
        
        dp[i-1][j+1] = max(dp[i-1][j+1], dp[i][j])
        dp[i][j+1] = max(dp[i][j+1], dp[i][j])
        dp[i+1][j+1] = max(dp[i+1][j+1], dp[i][j])
    }
}

var ans = 0
for i in 1...M {
    ans = max(ans, dp[i][N-1])
}
print(ans)

