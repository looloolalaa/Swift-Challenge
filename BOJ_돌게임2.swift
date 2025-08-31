// 마지막 돌
let N = Int(readLine()!)!
print(N % 2 == 0 ? "SK" : "CY")

//var dp = Array(repeating: 1, count: N+1)
//dp[1] = 0
//dp[2] = 1
//dp[3] = 0
//dp[4] = 1
//
//for i in 5...N {
//    if dp[i-1] == 1 && dp[i-3] == 1 {
//        dp[i] = 0
//    }
//}
//
//print(dp)
