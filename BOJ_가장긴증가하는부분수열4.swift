// LIS를 이루는 수열 찾기
let N = Int(readLine()!)!
let arr = [0] + readLine()!.split(separator: " ").map { Int($0)! }

var dp = Array(repeating: 0, count: N+1)
var front = Array(repeating: 0, count: N+1)
for i in 1...N {
    var maxi = -1
    var maxi_pos = -1
    for j in 0..<i {
        if arr[j] < arr[i] && maxi < dp[j] {
            maxi = dp[j]
            maxi_pos = j
        }
    }
    dp[i] = maxi + 1
    front[i] = maxi_pos
}

var ans = -1
var ans_pos = -1
for i in 1...N {
    if ans < dp[i] {
        ans = dp[i]
        ans_pos = i
    }
}

var res: [Int] = []
while ans_pos != 0 {
    res.append(arr[ans_pos])
    ans_pos = front[ans_pos]
}

print(ans)
print(res.reversed().map { String($0) }.joined(separator: " "))
