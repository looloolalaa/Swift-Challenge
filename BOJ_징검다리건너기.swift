// 1회 스킬 소모 상태 dp
let N = Int(readLine()!)!
var arr: [[Int]] = []
for _ in 0..<N-1 {
    arr.append(readLine()!.split(separator: " ").map { Int($0)! })
}
let k = Int(readLine()!)!

var dp = Array(repeating: [Int(1e9), Int(1e9)] , count: N+2)
dp[0][0] = 0
for i in 0..<N-1 {
    let (a, b) = (arr[i][0], arr[i][1])
    
    dp[i+1][0] = min(dp[i+1][0], dp[i][0] + a)
    dp[i+2][0] = min(dp[i+2][0], dp[i][0] + b)
    dp[i+3][1] = min(dp[i+3][1], dp[i][0] + k)
    
    dp[i+1][1] = min(dp[i+1][1], dp[i][1] + a)
    dp[i+2][1] = min(dp[i+2][1], dp[i][1] + b)
}

print(dp[N-1].min()!)
