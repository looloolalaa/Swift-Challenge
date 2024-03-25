// 방향 dfs
let line = readLine()!.split(separator: " ").map { Int($0)! }
let (N, M) = (line[0], line[1])

var arr: [[String]] = []
for _ in 0..<N {
    arr.append(Array(readLine()!.map { String($0) }))
}

let dxy = ["-": [0, 1], "|": [1, 0]]
func valid(_ i: Int, _ j: Int) -> Bool {
    return (0..<N)~=i && (0..<M)~=j
}

func dfs(_ i: Int, _ j: Int, _ d: String) {
    arr[i][j] = "."
    let (a, b) = (i+dxy[d]![0], j+dxy[d]![1])
    if valid(a, b) && arr[a][b] == d {
        dfs(a, b, d)
    }
}

var res = 0
for i in 0..<N {
    for j in 0..<M {
        if arr[i][j] != "." {
            dfs(i, j, arr[i][j])
            res += 1
        }
    }
}

print(res)
