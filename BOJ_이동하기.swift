// 사각형 길 가짓수
let NM = readLine()!.split(separator: " ").map { Int($0)! }
let (N, M) = (NM[0], NM[1])
var table = [Array(repeating: 0, count: M+1)]
for _ in 0..<N {
    table.append([0] + readLine()!.split(separator: " ").map { Int($0)! })
}

for i in 1...N {
    for j in 1...M {
        table[i][j] += max(table[i-1][j], table[i][j-1])
    }
}

print(table[N][M])
