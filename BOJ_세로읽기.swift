// 문자열 인덱스
var n = 0
var table: [[String]] = []
for _ in 0..<5 {
    let line = Array(readLine()!).map { String($0) }
    n = max(n, line.count)
    table.append(line)
}

table = table.map { $0 + Array(repeating: "", count: n - $0.count)}

var result = ""
for j in 0..<n {
    for i in 0..<5 {
        result += table[i][j]
    }
}

print(result)
