// dp 정의하기
let N = Int(readLine()!)!
var graph: [[Int]] = []
for _ in 0..<N {
    graph.append(readLine()!.split(separator: " ").map { Int($0)! })
}
let INF = Int(1e9)

var dp = Array(repeating: Array(repeating: -1, count: N), count: 1<<N)
// dp[10101][2]

func getDist(_ visited: Int, _ now: Int) -> Int {
    if dp[visited][now] != -1 {
        return dp[visited][now]
    }
    
    if visited == (1<<N)-1 {
        dp[visited][now] = (graph[now][0] == 0) ? INF : graph[now][0]
        
    } else {
        var minDist = INF
        for a in 0..<N where a != now && graph[now][a] != 0 {
            if (visited & (1<<a)) == 0 {
                minDist = min(minDist, graph[now][a] + getDist(visited | (1<<a), a))
            }
        }
        
        dp[visited][now] = minDist
    }
    
    return dp[visited][now]
}

print(getDist(1, 0))
