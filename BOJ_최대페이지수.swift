// 01배낭 
let NM = readLine()!.split(separator: " ").map { Int($0)! }
let (N, M) = (NM[0], NM[1])

var dp = Array(repeating: Array(repeating: 0, count: N+1), count: M+1)

for i in 1...M {
    let nm = readLine()!.split(separator: " ").map { Int($0)! }
    let (n, m) = (nm[0], nm[1])
    
    for j in 0...N {
        if j < n {
            dp[i][j] = dp[i-1][j]
        } else {
            dp[i][j] = max(dp[i-1][j], dp[i-1][j-n] + m)
        }
    }
}

print(dp[M][N])

