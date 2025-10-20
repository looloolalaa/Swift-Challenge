// 웅덩이 없는 2차원배열 경로수 + dp
let MN = readLine()!.split(separator: " ").map { Int($0)! }
let (N, M) = (MN[0], MN[1])
var arr: [[Int]] = []
for _ in 0..<N {
    arr.append(readLine()!.split(separator: " ").map { Int($0)! })
}

var dp = Array(repeating: Array(repeating: -1, count: M), count: N)
dp[0][0] = 1

let dxy = [[0,1], [1,0], [0,-1], [-1,0]]
func valid(_ i: Int, _ j: Int) -> Bool {
    return (0..<N)~=i && (0..<M)~=j
}

func cnt(_ n: Int, _ m: Int) -> Int {
    if dp[n][m] != -1 {
        return dp[n][m]
    }
    
    dp[n][m] = 0
    for d in dxy {
        let (a, b) = (n+d[0], m+d[1])
        if valid(a, b) && arr[a][b] > arr[n][m] {
            dp[n][m] += cnt(a, b)
        }
    }
    return dp[n][m]
}

print(cnt(N-1, M-1))

