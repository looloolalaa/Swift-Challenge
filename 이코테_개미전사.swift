// dp 2가지 방법
let arr = [1,3,1,5]
var dp = Array(repeating: [0, 0], count: 5)

for i in 1..<5 {
    dp[i][0] = dp[i-1][1]
    dp[i][1] = dp[i-1][0] + arr[i-1]
}
print(dp)

var dp2 = Array(repeating: 0, count: 6)
for i in 2..<6 {
    dp2[i] = max(dp2[i-2] + arr[i-2], dp2[i-1])
}

print(dp2)
