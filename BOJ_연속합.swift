// 구간합의 최댓값
let n = Int(readLine()!)!
let arr = [0] + readLine()!.split(separator: " ").map { Int($0)! }
var dp = Array(repeating: 0, count: n+1)

var result = -1000
for i in 1..<n+1 {
    dp[i] = max(dp[i-1] + arr[i], arr[i])
    result = max(result, dp[i])
}

print(result)


