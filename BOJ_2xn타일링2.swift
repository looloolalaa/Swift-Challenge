var dp = Array(repeating: 0, count: 1001)
dp[1] = 1
dp[2] = 3

for i in 3...1000 {
    dp[i] = (2*dp[i-2] + dp[i-1]) % 10007
}

let n = Int(readLine()!)!
print(dp[n])
