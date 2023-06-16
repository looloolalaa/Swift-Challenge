// 2차원 누적합
import Foundation

var table = Array(repeating: Array(repeating: 0, count: 102), count: 102)

let n = Int(readLine()!)!
for _ in 0..<n {
    let inp = readLine()!.components(separatedBy: " ")
    let (i, j) = (Int(inp[0])! + 1, Int(inp[1])! + 1)
    table[i][j] += 1
    table[i+10][j] -= 1
    table[i][j+10] -= 1
    table[i+10][j+10] += 1
}

for i in 1..<102 {
    for j in 1..<102 {
        table[i][j] += table[i-1][j] + table[i][j-1] - table[i-1][j-1]
    }
}

var result = 0
for i in 1..<101 {
    for j in 1..<101 {
        if table[i][j] > 0 {
            result += 1
        }
    }
}

print(result)
