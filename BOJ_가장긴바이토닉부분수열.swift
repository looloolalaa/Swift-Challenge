// 산 모양 부분 수열
let N = Int(readLine()!)!
let arr = [0] + readLine()!.split(separator: " ").map { Int($0)! } + [0]

var dp = Array(repeating: 0, count: N+2)
for i in 1...N {
    var maxi = -1
    for j in 0..<i {
        if arr[j] < arr[i] {
            maxi = max(maxi, dp[j])
        }
    }
    dp[i] = maxi + 1
}

var dp2 = Array(repeating: 0, count: N+2)
for i in stride(from: N, to: 0, by: -1) {
    var maxi = -1
    for j in stride(from: N+1, to: i, by: -1) {
        if arr[i] > arr[j] {
            maxi = max(maxi, dp2[j])
        }
    }
    dp2[i] = maxi + 1
}

var ans = -1
for i in 1...N {
    ans = max(ans, dp[i] + dp2[i] - 1)
}
print(ans)
