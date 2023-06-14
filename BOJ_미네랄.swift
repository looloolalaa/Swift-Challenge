// 테두리가 아닌 클러스터의 모든 점 확인
import Foundation

let inp = readLine()!.components(separatedBy: " ")
let (R, C) = (Int(inp[0])!, Int(inp[1])!)

var board: [[String]] = []
for _ in 0..<R {
    board.append(Array(readLine()!).map { String($0) })
}
let N = Int(readLine()!)!
let commands = readLine()!.components(separatedBy: " ").map { Int($0)! }

let dxy = [[0, 1], [1, 0], [0, -1], [-1, 0]]
func valid(_ i: Int, _ j: Int) -> Bool {
    return 0<=i && i<R && 0<=j && j<C
}

for k in 0..<commands.count {
    if k % 2 == 0 {
        var stick = [R-commands[k], 0]
        while stick[1]<C && board[stick[0]][stick[1]] == "." {
            stick[1] += 1
        }
        if stick[1] < C {
            board[stick[0]][stick[1]] = "."
        }
    } else {
        var stick = [R-commands[k], C-1]
        while 0<=stick[1] && board[stick[0]][stick[1]] == "." {
            stick[1] -= 1
        }
        if 0 <= stick[1] {
            board[stick[0]][stick[1]] = "."
        }
    }

    var visited = Array(repeating: Array(repeating: false, count: C), count: R)

    var cluster: [[Int]] = []
    func dfs(_ i: Int, _ j: Int) {
        cluster.append([i, j])
        visited[i][j] = true

        for d in dxy {
            let (a, b) = (i+d[0], j+d[1])
            if valid(a, b) && board[a][b] == "x" && !visited[a][b] {
                dfs(a, b)
            }
        }
    }

    var res = Array(repeating: Array(repeating: ".", count: C), count: R)

    for j in 0..<C {
        if board[R-1][j] == "x" && !visited[R-1][j] {
            dfs(R-1, j)
        }
    }
    // 바닥
    for xy in cluster {
        res[xy[0]][xy[1]] = "x"
    }


    cluster = []
    for i in 0..<R {
        for j in 0..<C {
            if board[i][j] == "x" && !visited[i][j] {
                dfs(i, j)
            }
        }
    }

    if cluster.isEmpty { continue }
    // 공중
    let body = Set<[Int]>(cluster)
    var minDis = R
    for xy in cluster {
        var i = xy[0]+1
        while i < R {
            if !body.contains([i, xy[1]]) && board[i][xy[1]] == "x" {
                break
            }
            i += 1
        }
        minDis = min(minDis, i - xy[0])
    }

    for xy in cluster {
        res[xy[0] + minDis - 1][xy[1]] = "x"
    }

    board = res
}

for b in board {
    print(b.joined())
}

