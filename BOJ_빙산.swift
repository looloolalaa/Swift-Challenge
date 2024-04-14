// 눈 녹이기
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

func num() -> Int {
    var visited = Array(repeating: Array(repeating: false, count: M), count: N)
    
    func dfs(_ i: Int, _ j: Int) {
        for d in dxy {
            let (a, b) = (i+d[0], j+d[1])
            if valid(a, b) && arr[a][b] != 0 && !visited[a][b] {
                visited[a][b] = true
                dfs(a, b)
            }
        }
    }
    
    var n = 0
    for i in 0..<N {
        for j in 0..<M {
            if arr[i][j] != 0 && !visited[i][j] {
                n += 1
                visited[i][j] = true
                dfs(i, j)
            }
        }
    }
    
    return n
}

func melt() {
    var zero = Array(repeating: Array(repeating: 0, count: M), count: N)
    for i in 0..<N {
        for j in 0..<M {
            if arr[i][j] != 0 {
                var c = 0
                for d in dxy {
                    let (a, b) = (i+d[0], j+d[1])
                    if valid(a, b) && arr[a][b] == 0 {
                        c += 1
                    }
                }
                zero[i][j] = c
            }
        }
    }
    
    for i in 0..<N {
        for j in 0..<M {
            if arr[i][j] != 0 {
                arr[i][j] -= zero[i][j]
                if arr[i][j] < 0 { arr[i][j] = 0 }
            }
        }
    }
}

var day = 0
while true {
    let n = num()
    if n >= 2 {
        print(day)
        break
    }
    if n == 0 {
        print(0)
        break
    }
    
    melt()
    day += 1
}
