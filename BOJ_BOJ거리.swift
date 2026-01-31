// 점프 가능 위치 dp
let N = Int(readLine()!)!
let arr = Array(readLine()!)
let nxt: [Character: Character] = ["B": "O", "O": "J", "J": "B"]

let INF = 1000*1000
var dp = Array(repeating: INF, count: N)
dp[0] = 0

for i in 0..<N {
    if dp[i] == INF { continue }
    
    let aim = nxt[arr[i]]!
    for j in i+1..<N where arr[j] == aim {
        dp[j] = min(dp[j], dp[i] + (j-i)*(j-i))
    }
}

print(dp[N-1] == INF ? -1 : dp[N-1])
