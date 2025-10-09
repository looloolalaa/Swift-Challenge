// 동전 누적 dp
let nk = readLine()!.split(separator: " ").map { Int($0)! }
let (n, k) = (nk[0], nk[1])
var dp = Array(repeating: Int64(0), count: k+1)
dp[0] = 1

for _ in 0..<n {
    let coin = Int(readLine()!)!
    if coin > k { continue }

    for j in coin...k {
        dp[j] += dp[j-coin]
        if dp[j] > 1<<31 { dp[j] = 0 }
    }
}

print(dp[k])

//
//[1,1,1,1,1, 1,1,1,1,1, 1]
//[1,1,2,2,3, 3,4,4,5,5, 6]
//[1,1,2,2,3, 4,5,6,7,8, 10]
