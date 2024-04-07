// 인접 3이상 녹이기
let line = readLine()!.split(separator: " ").map { Int($0)! }
let (R, C) = (line[0], line[1])

var arr: [[String]] = Array(repeating: Array(repeating: ".", count: C+2), count: R+2)
for i in 0..<R {
    let line = readLine()!.map { String($0) }
    for j in 0..<C {
        arr[i+1][j+1] = line[j]
    }
}

let dxy = [[0, 1], [1, 0], [0, -1], [-1, 0]]

var melt: [(Int, Int)] = []
for i in 1...R {
    for j in 1...C {
        if arr[i][j] == "X" {
            var sea = 0
            for d in dxy {
                let (a, b) = (i+d[0], j+d[1])
                if arr[a][b] == "." {
                    sea += 1
                }
            }
            if sea >= 3 { melt.append((i, j)) }
        }
    }
}

for (i, j) in melt {
    arr[i][j] = "."
}

var (minI, maxI) = (R+1, 0)
var (minJ, maxJ) = (C+1, 0)
for i in 1...R {
    for j in 1...C {
        if arr[i][j] == "X" {
            minI = min(minI, i)
            maxI = max(maxI, i)
            minJ = min(minJ, j)
            maxJ = max(maxJ, j)
        }
    }
}

for a in arr[minI...maxI] {
    print(a[minJ...maxJ].joined(separator: ""))
}
