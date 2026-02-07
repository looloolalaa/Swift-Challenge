// 그래프 경로수 dp
let edges = [[1,2], [0,2,3], [0,1,3,5], [1,2,4,5], [3,5,6], [2,3,4,7], [4,7], [5,6]]

var dp = [1,0,0,0,0,0,0,0]

let D = Int(readLine()!)!
for _ in 0..<D {
    var newDP = [0,0,0,0,0,0,0,0]
    for i in 0..<8 {
        for a in edges[i] {
            newDP[a] += dp[i]
        }
    }
    dp = newDP.map { $0 % 1_000_000_007 }
}

print(dp[0])
