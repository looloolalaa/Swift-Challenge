// 01배낭 비슷 문제: ~(i-1) 까지 가짓수에 더해가기
let N = Int(readLine()!)!
let M = Int(readLine()!)!

var dp = Array(repeating: Array(repeating: 0, count: M+1), count: N+1)
dp[1][1] = 1

for i in 1...N {
    for j in i...M {
        if i == 1 && j == 1 { continue }
        
        dp[i][j] = dp[i-1][j-1] + dp[i][j-1]
    }
}


print(dp[N][M])
