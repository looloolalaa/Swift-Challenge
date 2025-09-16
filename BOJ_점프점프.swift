// 최소 점프 dp
let N = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map { Int($0)! }

var dp = Array(repeating: 1000, count: 1101)
dp[0] = 0

for i in 0..<N {
    for j in i...i+arr[i] {
        dp[j] = min(dp[j], dp[i] + 1)
    }
}

print(dp[N-1] == 1000 ? -1 : dp[N-1])

