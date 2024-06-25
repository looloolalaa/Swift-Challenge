// 조건 줄이기 (Set)
import Foundation

let n = Int(readLine()!)!
let line = Array(readLine()!)

var S: [[Character]] = []
var s = 0
for cnt in stride(from: n, to: 0, by: -1) {
    S.append(Array(repeating: ".", count: n-cnt) + line[s..<s+cnt])
    s += cnt
}

var res = Array(repeating: 0, count: n)
func dfs(_ j: Int) {
    if j == n {
        print(res.map { String($0) }.joined(separator: " "))
        exit(0)
    }
    
    var candi = Set(-10...10)
    for i in 0...j {
        let sign = S[i][j]
        let front = res[i..<j].reduce(0, +)
        
        if sign == "0" {
            candi = candi.filter { $0 == -front }
        } else if sign == "+" {
            candi = candi.filter { $0 > -front }
        } else if sign == "-" {
            candi = candi.filter { $0 < -front }
        }
    }
    
    for c in candi {
        res[j] = c
        dfs(j+1)
    }
}

dfs(0)

