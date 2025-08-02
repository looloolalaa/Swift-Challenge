// LIS 응용
let N = Int(readLine()!)!
let arr = [0] + readLine()!.split(separator: " ").map { Int($0)! }

var dp = Array(repeating: 0, count: N+1)

for i in 1...N {
    var maxi = 0
    for j in 0..<i where arr[j] < arr[i] {
        maxi = max(maxi, dp[j])
    }
    dp[i] = maxi + arr[i]
}

print(dp.max()!)
