// 1,2,3 붙이기
var dp = Array(repeating: Array(repeating: 0, count: 1002), count: 1004)
dp[0][0] = 1

for i in 0...1000 {
    for j in 0...i {
        dp[i+1][j+1] = (dp[i+1][j+1] + dp[i][j]) % 1_000_000_009
        dp[i+2][j+1] = (dp[i+2][j+1] + dp[i][j]) % 1_000_000_009
        dp[i+3][j+1] = (dp[i+3][j+1] + dp[i][j]) % 1_000_000_009
    }
}

for _ in 0..<Int(readLine()!)! {
    let nm = readLine()!.split(separator: " ").map { Int($0)! }
    let (n, m) = (nm[0], nm[1])

    print(dp[n][m])
}
