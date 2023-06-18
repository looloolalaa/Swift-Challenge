// 같은 로직 python: 통과 swift: 시간초과
// 방향 돌리기
import Foundation

let inp = readLine()!.components(separatedBy: " ").map { Int($0)! }
let (R, C, T) = (inp[0], inp[1], inp[2])

var table: [[Int]] = []
for _ in 0..<R {
    table.append(readLine()!.components(separatedBy: " ").map { Int($0)! })
}

var cleaner = [-1, -1]
for i in 0..<R {
    if table[i][0] == -1 {
        cleaner[0] = i
        cleaner[1] = i+1
        break
    }
}

let dxy: [[Int]] = [[0, 1], [-1, 0], [0, -1], [1, 0]]

var upOrder: [[Int]] = []
var d = 0
var start = [cleaner[0], 0 + dxy[d][1]]
while table[start[0]][start[1]] != -1 {
    upOrder.append(start)

    if !valid(start[0]+dxy[d][0], start[1]+dxy[d][1]) {
        d = (d+1) % 4
    }
    start = [start[0]+dxy[d][0], start[1]+dxy[d][1]]
}

var downOrder: [[Int]] = []
d = 0
start = [cleaner[1], 0 + dxy[d][1]]
while table[start[0]][start[1]] != -1 {
    downOrder.append(start)

    if !valid(start[0]+dxy[d][0], start[1]+dxy[d][1]) {
        d = (d-1 + 4) % 4
    }
    start = [start[0]+dxy[d][0], start[1]+dxy[d][1]]
}


func valid(_ i: Int, _ j: Int) -> Bool {
    return 0<=i && i<R && 0<=j && j<C
}

func spread() {
    var change = Array(repeating: Array(repeating: 0, count: C), count: R)

    for i in 0..<R {
        for j in 0..<C {

            if table[i][j] > 0 {
                var spr: [[Int]] = []
                for d in dxy {
                    let (a, b) = (i+d[0], j+d[1])
                    if !valid(a, b) || table[a][b] == -1 {
                        continue
                    }
                    spr.append([a, b])
                }

                let Arc = table[i][j]
                for a in spr {
                    change[a[0]][a[1]] += Arc/5
                }
                change[i][j] -= (Arc/5)*spr.count
            }
        }
    }

    for i in 0..<R {
        for j in 0..<C {
            table[i][j] += change[i][j]
        }
    }
}

func clean() {
    var la = upOrder.last!
    table[la[0]][la[1]] = 0
    for i in stride(from: upOrder.count-1, to: 0, by: -1) {
        let (a, b) = (upOrder[i], upOrder[i-1])
        table[a[0]][a[1]] = table[b[0]][b[1]]
        table[b[0]][b[1]] = 0
    }

    la = downOrder.last!
    table[la[0]][la[1]] = 0
    for i in stride(from: downOrder.count-1, to: 0, by: -1) {
        let (a, b) = (downOrder[i], downOrder[i-1])
        table[a[0]][a[1]] = table[b[0]][b[1]]
        table[b[0]][b[1]] = 0
    }
}

for _ in 0..<T {
    spread()
    clean()
}

var result = 0
for i in 0..<R {
    for j in 0..<C {
        if table[i][j] > 0 {
            result += table[i][j]
        }
    }
}
print(result)
