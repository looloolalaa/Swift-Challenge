// 01배낭 같은문제
let N = Int(readLine()!)!
let hp = [0]+readLine()!.split(separator: " ").map { Int($0)! }
let joy = [0]+readLine()!.split(separator: " ").map { Int($0)! }

var dp = Array(repeating: Array(repeating: 0, count: 100), count: N+1)


for i in 1...N {
    for j in 0..<100 {
        if hp[i] > j {
            dp[i][j] = dp[i-1][j]
        } else {
            dp[i][j] = max(dp[i-1][j], dp[i-1][j - hp[i]] + joy[i])
        }
    }
}

print(dp[N][99])
