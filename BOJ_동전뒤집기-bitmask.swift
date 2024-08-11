// 행을 뒤집거나 안뒤집거나 비트마스크 표현
let N = Int(readLine()!)!
var arr: [[Int]] = []
for _ in 0..<N {
    arr.append(readLine()!.map { $0 == "T" ? 1 : 0 })
}

var ans = N*N+1
for bitMask in 0..<(1<<N) {
    var total = 0
    for j in 0..<N {
        var tCountOfColumn = 0
        for i in 0..<N {
            var ch = arr[i][j]
            if (bitMask & (1<<i)) != 0 {
                ch = (ch == 0) ? 1 : 0
            }
            tCountOfColumn += ch
        }
        total += min(tCountOfColumn, N-tCountOfColumn)
    }
    ans = min(ans, total)
}

print(ans)
