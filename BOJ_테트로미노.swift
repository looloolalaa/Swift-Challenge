// 모양 만들기
import Foundation

let inp = readLine()!.components(separatedBy: " ").map { Int($0)! }
let (N, M) = (inp[0], inp[1])
var table: [[Int]] = []
for _ in 0..<N {
    table.append(readLine()!.components(separatedBy: " ").map { Int($0)! })
}


func getMaxi(_ shape: [[Int]]) -> Int {
    let (x, y) = (shape.count, shape[0].count)

    var maxi = 0
    for i in 0..<(N-x+1) {
        for j in 0..<(M-y+1) {
            var s = 0
            for a in 0..<x {
                for b in 0..<y {
                    if shape[a][b] == 1 {
                        s += table[a+i][b+j]
                    }
                }
            }
            maxi = max(maxi, s)
        }
    }
    
    return maxi
}

let shapes = [
    [
        [1, 1, 1, 1]
    ],
    [
        [1],
        [1],
        [1],
        [1]
    ],
    [
        [1, 1],
        [1, 1]
    ],
    [
        [1, 0],
        [1, 0],
        [1, 1]
    ],
    [
        [1, 1, 1],
        [1, 0, 0]
    ],
    [
        [1, 1],
        [0, 1],
        [0, 1]
    ],
    [
        [0, 0, 1],
        [1, 1, 1]
    ],
    
    [
        [1, 0],
        [1, 1],
        [0, 1]
    ],
    [
        [0, 1, 1],
        [1, 1, 0]
    ],
    
    [
        [1, 1, 1],
        [0, 1, 0]
    ],
    [
        [0, 1],
        [1, 1],
        [0, 1]
    ],
    [
        [0, 1, 0],
        [1, 1, 1]
    ],
    [
        [1, 0],
        [1, 1],
        [1, 0]
    ]
]

func symm(_ shape: [[Int]]) -> [[Int]] {
    let (x, y) = (shape.count, shape[0].count)
    var res = Array(repeating: Array(repeating: 0, count: x), count: y)
    for i in 0..<x {
        for j in 0..<y {
            res[j][i] = shape[i][j]
        }
    }
    return res
}

var result = 0
for shape in shapes {
    result = max(result, getMaxi(shape))
    result = max(result, getMaxi(symm(shape)))
}
print(result)



