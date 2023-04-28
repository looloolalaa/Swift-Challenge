// 상담일수
let n = Int(readLine()!)!
var t: [Int] = [0]
var p: [Int] = [0]
for _ in 0..<n {
    let temp = readLine()!.split(separator: " ").map { Int($0)! }
    t.append(temp[0])
    p.append(temp[1])
}

var dp = Array(repeating: 0, count: 25)

for i in 1..<n+1 {
    let before = dp[i-1]
    for j in i..<(i + t[i]) {
        dp[j] = max(dp[j], before)
    }
    dp[i + t[i]] = max(dp[i + t[i]], dp[i] + p[i])
}

print(dp)
print(dp[n+1])
