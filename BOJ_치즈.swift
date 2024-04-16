// 테두리만 녹이기
import Foundation

let line = readLine()!.split(separator: " ").map { Int($0)! }
let (N, M) = (line[0], line[1])
var arr: [[Int]] = []
for _ in 0..<N {
    arr.append(readLine()!.split(separator: " ").map { Int($0)! })
}

let dxy = [[0,1], [1,0], [0,-1], [-1,0]]
func valid(_ i: Int, _ j: Int) -> Bool {
    return (0..<N)~=i && (0..<M)~=j
}

func melted() -> [[Int]] {
    var arr = arr
    var isMelt = Array(repeating: Array(repeating: 0, count: M), count: N)
    
    func dfs(_ i: Int, _ j: Int) {
        for d in dxy {
            let (a, b) = (i+d[0], j+d[1])
            if valid(a, b) && isMelt[a][b] != 4 {
                if arr[a][b] == 1 {
                    isMelt[a][b] = 1
                }
                if arr[a][b] == 0 {
                    isMelt[a][b] = 4
                    dfs(a, b)
                }
            }
        }
    }
    
    isMelt[0][0] = 4
    dfs(0, 0)
    
    for i in 0..<N {
        for j in 0..<M {
            if isMelt[i][j] == 1 {
                arr[i][j] = 0
            }
        }
    }
    
    return arr
}

func allMelt(_ arr: [[Int]]) -> Bool {
    for i in 0..<N {
        for j in 0..<M {
            if arr[i][j] != 0 {
                return false
            }
        }
    }
    return true
}

func num() -> Int {
    var n = 0
    for i in 0..<N {
        for j in 0..<M {
            if arr[i][j] == 1 {
                n += 1
            }
        }
    }
    return n
}

if allMelt(arr) {
    print(0)
    print(0)
    exit(0)
}

var day = 0
while true {
    let nxt = melted()
    if allMelt(nxt) {
        print(day + 1)
        print(num())
        break
    }
    
    arr = nxt
    day += 1
}
