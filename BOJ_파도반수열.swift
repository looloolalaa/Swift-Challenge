var dp = [0,1,1,1,2,2]

for i in 1...95 {
    dp.append(dp[i] + dp[i+4])
}

let T = Int(readLine()!)!
for _ in 0..<T {
    let N = Int(readLine()!)!
    print(dp[N])
}
