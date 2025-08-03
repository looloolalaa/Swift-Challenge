// LIS 응용
let N = Int(readLine()!)!
let arr = [1001] + readLine()!.split(separator: " ").map { Int($0)! }

var dp = Array(repeating: 0, count: N+1)


for i in 1...N {
    var maxLen = -1
    for j in 0..<i {
        if arr[j] > arr[i] {
            maxLen = max(maxLen, dp[j])
        }
    }
    dp[i] = maxLen + 1
}

print(dp.max()!)
