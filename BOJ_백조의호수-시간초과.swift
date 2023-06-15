// 필드의 모든 얼음 녹이기 시간초과
import Foundation

let inp = readLine()!.components(separatedBy: " ")
let (R, C) = (Int(inp[0])!, Int(inp[1])!)

var table: [[String]] = []
for _ in 0..<R {
    table.append(Array(readLine()!).map { String($0) })
}

var ll: [[Int]] = []

for i in 0..<R {
    for j in 0..<C {
        if table[i][j] == "L" {
            ll.append([i, j])
        }
    }
}

func valid(_ i: Int, _ j: Int) -> Bool {
    return 0<=i && i<R && 0<=j && j<C
}

let dxy = [[0, 1], [1, 0], [0, -1], [-1, 0]]

func melt() {
    var notMelt: [[Int]] = []
    for i in 0..<R {
        for j in 0..<C {
            if table[i][j] == "X" {
                var isMelt = false
                for d in dxy {
                    let (a, b) = (i+d[0], j+d[1])
                    if valid(a, b) && table[a][b] != "X" {
                        isMelt = true
                        break
                    }
                }
                if !isMelt {
                    notMelt.append([i, j])
                }

            }
        }
    }

    var temp = Array(repeating: Array(repeating: ".", count: C), count: R)
    for xy in notMelt {
        temp[xy[0]][xy[1]] = "X"
    }
    table = temp
}

var visited = Array(repeating: Array(repeating: false, count: C), count: R)
func dfs(_ i: Int, _ j: Int) {
    visited[i][j] = true

    for d in dxy {
        let (a, b) = (i+d[0], j+d[1])
        if valid(a, b) && table[a][b] != "X" && !visited[a][b] {
            dfs(a, b)
        }
    }
}


var day = 0
while true {
    for i in 0..<R {
        for j in 0..<C {
            visited[i][j] = false
        }
    }

    let (start, end) = (ll[0], ll[1])
    dfs(start[0], start[1])
    if visited[end[0]][end[1]] {
        break
    }

    melt()
    day += 1
}

print(day)
