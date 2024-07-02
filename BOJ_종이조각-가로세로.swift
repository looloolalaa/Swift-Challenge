// 01로 가로세로 모양 종이 표현
let NM = readLine()!.split(separator: " ").map { Int($0)! }
let (N, M) = (NM[0], NM[1])
var table: [[Character]] = []
for _ in 0..<N {
    table.append(Array(readLine()!))
}
var bitArr = Array(repeating: Array(repeating: -1, count: M), count: N)

func calc(_ arr: [[Int]]) -> Int {
    var total = 0
    for i in 0..<N {
        var s = "0"
        for j in 0..<M {
            if bitArr[i][j] == 0 {
                total += Int(s)!
                s = "0"
            } else if bitArr[i][j] == 1 {
                s += "\(table[i][j])"
            }
        }
        total += Int(s)!
    }
    
    for j in 0..<M {
        var s = "0"
        for i in 0..<N {
            if bitArr[i][j] == 1 {
                total += Int(s)!
                s = "0"
            } else if bitArr[i][j] == 0 {
                s += "\(table[i][j])"
            }
        }
        total += Int(s)!
    }
    
    return total
}

var ans = 0
func dfs(_ p: Int) {
    if p == N*M {
        ans = max(ans, calc(bitArr))
        return
    }
    
    let (i, j) = (p/M, p%M)
    for x in [0, 1] {
        bitArr[i][j] = x
        dfs(p+1)
    }
}

dfs(0)
print(ans)

