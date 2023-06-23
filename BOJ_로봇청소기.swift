// 문제 조건 구현
import Foundation

var inp = readLine()!.components(separatedBy: " ").map { Int($0)! }
let (N, M) = (inp[0], inp[1])

inp = readLine()!.components(separatedBy: " ").map { Int($0)! }
var (x, y, d) = (inp[0], inp[1], inp[2])

var table: [[Int]] = []
for _ in 0..<N {
    table.append(readLine()!.components(separatedBy: " ").map { Int($0)! })
}

let dxy = [[-1, 0], [0, 1], [1, 0], [0, -1]]
func valid(_ i: Int, _ j: Int) -> Bool {
    return 0<=i && i<N && 0<=j && j<M
}

func go() -> Bool {
    if table[x][y] == 0 {
        table[x][y] = 2
    } else {
        var space: [[Int]] = []
        for di in dxy {
            let (a, b) = (x+di[0], y+di[1])
            if valid(a, b) && table[a][b] == 0 {
                space.append([a, b])
            }
        }

        if space.isEmpty {
            let (nx, ny) = (x-dxy[d][0], y-dxy[d][1])
            if table[nx][ny] != 1 {
                (x, y) = (nx, ny)

            } else if table[nx][ny] == 1 {
                return true
            }

        } else {
            d = (d-1+4)%4
            let (nx, ny) = (x+dxy[d][0], y+dxy[d][1])
            if table[nx][ny] == 0 {
                (x, y) = (nx, ny)
            }

        }
    }

    return false
}


while true {
    let done = go()
    if done { break }
}

var result = 0
for i in 0..<N {
    for j in 0..<M {
        if table[i][j] == 2 {
            result += 1
        }
    }
}

//for t in table {
//    print(t)
//}
print(result)
