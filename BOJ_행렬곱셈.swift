// res[i][j] += A[i][m] * B[m][j]
let line = readLine()!.split(separator: " ").map { Int($0)! }
let (N, M) = (line[0], line[1])
var A: [[Int]] = []
for _ in 0..<N {
    A.append(readLine()!.split(separator: " ").map { Int($0)! })
}

let li = readLine()!.split(separator: " ").map { Int($0)! }
let (_, K) = (li[0], li[1])
var B: [[Int]] = []
for _ in 0..<M {
    B.append(readLine()!.split(separator: " ").map { Int($0)! })
}

var res = Array(repeating: Array(repeating: 0, count: K), count: N)
for i in 0..<N {
    for j in 0..<K {
        for m in 0..<M {
            res[i][j] += A[i][m] * B[m][j]
        }
    }
}

for r in res {
    print(r.map { String($0) }.joined(separator: " "))
}
