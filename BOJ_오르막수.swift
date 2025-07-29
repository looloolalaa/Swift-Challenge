// 마지막자리 숫자 뒤에 더 붙을수 있는 개수
let N = Int(readLine()!)!

var dp = Array(repeating: 1, count: 10)
for _ in 0..<N-1 {
    var new_dp = Array(repeating: 0, count: 10)
    for i in 0...9 {
        for j in i...9 {
            new_dp[j] += dp[i]
            new_dp[j] %= 10007
        }
    }
    dp = new_dp
}

print(dp.reduce(0, +) % 10007)
