// dp 안의 dp 이용하기
let N = Int(readLine()!)!
let arr = [0] + readLine()!.split(separator: " ").map { Int($0)! }

var dp = Array(repeating: 0, count: N+1)
for i in 1...N {
    for j in (1...i).reversed() {
        dp[i] = max(dp[i], arr[j] + dp[i-j])
    }
}

print(dp[N])

//[0, 0, 1, 5, 6]
//print(dp)
