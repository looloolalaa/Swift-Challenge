// 2차원 배열 방향 그래프에서 사이클 찾기
let NM = readLine()!.split(separator: " ").map { Int($0)! }
let (N, M) = (NM[0], NM[1])

var arr: [[Character]] = []
for _ in 0..<N {
    arr.append(Array(readLine()!))
}

var visited = Array(repeating: Array(repeating: false, count: M), count: N)
var recStack = Array(repeating: Array(repeating: false, count: M), count: N)

let dxy: [Character: [Int]] = ["D": [1, 0], "L": [0, -1], "U": [-1, 0], "R": [0, 1]]
func valid(_ i: Int, _ j: Int) -> Bool {
    return 0<=i&&i<N && 0<=j&&j<M
}

var ans = 0
func dfs(_ i: Int, _ j: Int) {
    if recStack[i][j] { ans += 1 }
    if visited[i][j] { return }
    
    visited[i][j] = true
    recStack[i][j] = true
    
    let d = dxy[arr[i][j]]!
    var (a, b) = (i+d[0], j+d[1])
    if !valid(a, b) { (a, b) = (i, j) }
    
    dfs(a, b)
    recStack[i][j] = false
}


for i in 0..<N {
    for j in 0..<M {
        if !visited[i][j] {
            dfs(i, j)
        }
    }
}

print(ans)
