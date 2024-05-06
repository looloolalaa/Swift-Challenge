// MST - 섬 연결하기
import Foundation

let line = readLine()!.split(separator: " ").map { Int($0)! }
let (N, M) = (line[0], line[1])

var arr: [[Int]] = []
for _ in 0..<N {
    arr.append(readLine()!.split(separator: " ").map { Int($0)! })
}

let dxy = [[0, 1], [1, 0], [0, -1], [-1, 0]]
func valid(_ i: Int, _ j: Int) -> Bool {
    return (0..<N)~=i && (0..<M)~=j
}

func dfs(_ i: Int, _ j: Int, _ n: Int) {
    arr[i][j] = n
    for d in dxy {
        let (a, b) = (i+d[0], j+d[1])
        if valid(a, b) && arr[a][b] == 1 {
            dfs(a, b, n)
        }
    }
}

var island = 2
for i in 0..<N {
    for j in 0..<M {
        if arr[i][j] == 1 {
            dfs(i, j, island)
            island += 1
        }
    }
}

var edges: [[Int]: Int] = [:]
func addEdges(_ line: [(Int, Int, Bool)]) {
    for idx in 0..<(line.count-1) {
        let (i, j, isStart) = line[idx]
        let (a, b, isStart2) = line[idx+1]
        let d = abs(i-a) + abs(j-b) - 1
        if isStart && !isStart2 && arr[i][j] != arr[a][b] && d >= 2 {
            let (mini, maxi) = (min(arr[i][j], arr[a][b]), max(arr[i][j], arr[a][b]))
            edges[[mini, maxi]] = min(edges[[mini, maxi], default: 101], d)
        }
    }
}

for i in 0..<N {
    var horizontal = [(0,0,false)]
    for j in 0..<(M-1) {
        if arr[i][j] != 0 && arr[i][j+1] == 0 {
            horizontal.append((i, j, true))
        }
        if arr[i][j] == 0 && arr[i][j+1] != 0 {
            horizontal.append((i, j+1, false))
        }
    }
    addEdges(horizontal)
}

for j in 0..<M {
    var vertical = [(0,0,false)]
    for i in 0..<(N-1) {
        if arr[i][j] != 0 && arr[i+1][j] == 0 {
            vertical.append((i, j, true))
        }
        if arr[i][j] == 0 && arr[i+1][j] != 0 {
            vertical.append((i+1, j, false))
        }
    }
    addEdges(vertical)
}


var parent = Array(0..<island)
func root(_ x: Int) -> Int {
    if parent[x] != x {
        parent[x] = root(parent[x])
    }
    return parent[x]
}

var ans = 0
for edge in Array(edges).sorted(by: { $0.value < $1.value }) {
    let (a, b) = (edge.key[0], edge.key[1])
    let (rootA, rootB) = (root(a), root(b))
    if rootA == rootB { continue }
    
    ans += edge.value
    parent[rootB] = rootA
}

let firstRoot = root(2)
for v in 3..<island {
    if firstRoot != root(v) {
        print(-1)
        exit(0)
    }
}

print(ans)

