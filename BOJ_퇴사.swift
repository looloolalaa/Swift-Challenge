// 상담의 (시간,가치)
let N = Int(readLine()!)!
var dp = Array(repeating: 0, count: N+2)

for i in 1...N {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    let (T, P) = (line[0], line[1])
    
    dp[i] = max(dp[i], dp[i-1])
    if i+T <= N+1 {
        dp[i+T] = max(dp[i+T], dp[i]+P)
    }
    
}

print(max(dp[N], dp[N+1]))
[0,0,0,10,30,0,45]
