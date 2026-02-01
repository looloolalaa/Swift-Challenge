// 2갈래길 top-down
let NM = readLine()!.split(separator: " ").map { Int($0)! }
let (N, M) = (NM[0], NM[1])
var arr: [[Int]] = []
for _ in 0..<N {
    arr.append(readLine()!.split(separator: " ").map { Int($0)! })
}

var dp = Array(repeating: Array(repeating: -1, count: M+1), count: N+1)
for j in 0..<M+1 {
    dp[0][j] = 0
}
for i in 0..<N+1 {
    dp[i][0] = 0
}

func getDP(_ i: Int, _ j: Int) -> Int {
    if dp[i][j] != -1 { return dp[i][j] }
    
    dp[i][j] = max(getDP(i-1, j), getDP(i, j-1)) + arr[i-1][j-1]
    return dp[i][j]
}


print(getDP(N, M))
