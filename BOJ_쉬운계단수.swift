// new_dp 배열
let N = Int(readLine()!)!

var dp = Array(repeating: 1, count: 10)
dp[0] = 0

var new_dp = Array(repeating: -1, count: 10)
for _ in 0..<N-1 {
    for i in 0...9 {
        if i == 0 {
            new_dp[i] = dp[1]
        } else if i == 9 {
            new_dp[i] = dp[8]
        } else {
            new_dp[i] = (dp[i-1]+dp[i+1]) % 1_000_000_000
        }
    }
    dp = new_dp
}

print(dp.reduce(0,+) % 1_000_000_000)
//9
//17
//32
//61
//116
//5018404112
