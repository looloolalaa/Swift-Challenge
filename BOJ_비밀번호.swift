// 인접 dp
let T = Int(readLine()!)!
var arr: [Int] = []
for _ in 0..<T {
    arr.append(Int(readLine()!)!)
}

let maxi = arr.max()!
var dp = Array(repeating: Array(repeating: 0, count: 10), count: maxi+1)
dp[1] = Array(repeating: 1, count: 10)

for i in 1..<maxi {
    dp[i+1][7] += dp[i][0]
    
    dp[i+1][2] += dp[i][1]
    dp[i+1][4] += dp[i][1]
    
    dp[i+1][1] += dp[i][2]
    dp[i+1][3] += dp[i][2]
    dp[i+1][5] += dp[i][2]
    
    dp[i+1][2] += dp[i][3]
    dp[i+1][6] += dp[i][3]
    
    dp[i+1][1] += dp[i][4]
    dp[i+1][5] += dp[i][4]
    dp[i+1][7] += dp[i][4]
    
    dp[i+1][2] += dp[i][5]
    dp[i+1][4] += dp[i][5]
    dp[i+1][6] += dp[i][5]
    dp[i+1][8] += dp[i][5]
    
    dp[i+1][3] += dp[i][6]
    dp[i+1][5] += dp[i][6]
    dp[i+1][9] += dp[i][6]
    
    dp[i+1][4] += dp[i][7]
    dp[i+1][8] += dp[i][7]
    dp[i+1][0] += dp[i][7]
    
    dp[i+1][5] += dp[i][8]
    dp[i+1][7] += dp[i][8]
    dp[i+1][9] += dp[i][8]
    
    dp[i+1][6] += dp[i][9]
    dp[i+1][8] += dp[i][9]
    
    for j in 0...9 {
        dp[i+1][j] %= 1_234_567
    }
}

for a in arr {
    print(dp[a].reduce(0, +) % 1_234_567)
}
