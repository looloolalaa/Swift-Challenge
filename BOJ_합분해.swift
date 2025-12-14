// 중복조합 2차원dp
let NK = readLine()!.split(separator: " ").map { Int($0)! }
let (N, K) = (NK[0], NK[1])

var dp = Array(repeating: Array(repeating: 0, count: K+1), count: N+1)
func getDp(_ n: Int, _ k: Int) -> Int {
    if k <= 1 { return 1 }
    
    if dp[n][k] == 0 {
        for i in 0...n {
            dp[n][k] += getDp(n-i, k-1)
            dp[n][k] %= 1_000_000_000
        }
    }
    
    return dp[n][k]
}

print(getDp(N, K))
