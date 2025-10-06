// 웅덩이없는 격자경로
func num(_ r: Int, _ c: Int) -> Int {
    var dp = Array(repeating: Array(repeating: 0, count: c), count: r)
    for j in 1..<c {
        dp[0][j] = 1
    }
    for i in 1..<r {
        dp[i][0] = 1
    }
    for i in 1..<r {
        for j in 1..<c {
            dp[i][j] += dp[i-1][j] + dp[i][j-1]
        }
    }
    return dp[r-1][c-1]
}

let NMK = readLine()!.split(separator: " ").map { Int($0)! }
let (N, M, K) = (NMK[0], NMK[1], NMK[2])

if K == 0 {
    print(num(N, M))
} else {
    let K = K-1
    let (n, m) = (K/M, K%M)
    print(num(n+1, m+1) * num(N-n, M-m))
}
