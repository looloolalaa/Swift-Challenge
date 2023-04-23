// 2차원 배열 누적합
let line = readLine()!.split(separator: " ").map { Int($0)! }
let (N, M) = (line[0], line[1])

var table: [[Int]] = []
for _ in 0..<N {
    table.append(readLine()!.split(separator: " ").map { Int($0)! })
}
var commands: [[Int]] = []
for _ in 0..<M {
    commands.append(readLine()!.split(separator: " ").map { Int($0)! })
}


var sum = Array(repeating: Array(repeating: 0, count: N+1), count: N+1)
for i in 1..<N+1 {
    for j in 1..<N+1 {
        sum[i][j] = table[i-1][j-1]
    }
}

for i in 1..<N+1 {
    for j in 1..<N+1 {
        sum[i][j] += sum[i-1][j] + sum[i][j-1] - sum[i-1][j-1]
    }
}
func get_sum(_ x1: Int, _ y1: Int, _ x2: Int, _ y2: Int) -> Int {
    return sum[x2][y2] - sum[x1-1][y2] - sum[x2][y1-1] + sum[x1-1][y1-1]
}

var results: [Int] = []
for com in commands {
    let (x1, y1, x2, y2) = (com[0], com[1], com[2], com[3])
    results.append(get_sum(x1, y1, x2, y2))
}
for r in results {
    print(r)
}
