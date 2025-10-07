// 파스칼 삼각형 2차원배열
var dp = Array(repeating: Array(repeating: 1, count: 30), count: 30)

for i in 2..<30 {
    for j in 1..<i {
        dp[i][j] = dp[i-1][j] + dp[i-1][j-1]
    }
}

let nk = readLine()!.split(separator: " ").map { Int($0)! }
let (n, k) = (nk[0], nk[1])
print(dp[n-1][k-1])
