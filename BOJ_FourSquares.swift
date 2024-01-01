var dp = Array(repeating: 10, count: 50001)
for j in 1...230 {
    if j*j < 50001 {
        dp[j*j] = 1
    }
}

for i in 1..<50001 {
    for j in 1...230 {
        if i + j*j < 50001 {
            dp[i+j*j] = min(dp[i+j*j], dp[i] + 1)
        }
    }
}

let n = Int(readLine()!)!
print(dp[n])
