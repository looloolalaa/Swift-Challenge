// 주위 근처 지뢰 개수
import Foundation

let n = Int(readLine()!)!
var bomb: [[Character]] = []
var arr: [[Character]] = []
for _ in 0..<n {
    bomb.append(Array(readLine()!))
}
for _ in 0..<n {
    arr.append(Array(readLine()!))
}

let dxy = [[-1, 0], [-1, 1], [0, 1], [1, 1], [1, 0], [1, -1], [0, -1], [-1, -1]]
func valid(_ i: Int, _ j: Int) -> Bool {
    return (0..<n)~=i && (0..<n)~=j
}

var res = Array(repeating: Array(repeating: ".", count: n), count: n)
var die = false
for i in 0..<n {
    for j in 0..<n {
        if arr[i][j] == "x" {
            if bomb[i][j] == "*" { die = true }
            
            let around = dxy.map { (i+$0[0], j+$0[1]) }.filter { valid($0, $1) && bomb[$0][$1] == "*" }.count
            res[i][j] = String(around)
        }
    }
}

if die {
    for i in 0..<n {
        for j in 0..<n {
            if bomb[i][j] == "*" {
                res[i][j] = "*"
            }
        }
    }
}

for r in res {
    print(r.joined(separator: ""))
}
