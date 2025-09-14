// 123가짓수 dp
var dp = Array(repeating: (0,0,0), count: 100_001)

dp[1] = (1,0,0)
dp[2] = (0,1,0)
dp[3] = (1,1,1)

for i in 4...100_000 {
    dp[i].0 = (dp[i-1].1 + dp[i-1].2) % 1_000_000_009
    dp[i].1 = (dp[i-2].0 + dp[i-2].2) % 1_000_000_009
    dp[i].2 = (dp[i-3].0 + dp[i-3].1) % 1_000_000_009
}

for _ in 0..<Int(readLine()!)! {
    let n = Int(readLine()!)!
    print((((dp[n].0 + dp[n].1) % 1_000_000_009) + dp[n].2) % 1_000_000_009)
}


