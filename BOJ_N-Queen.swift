// 백트래킹
let N = Int(readLine()!)!

var table = Array(repeating: -1, count: N)

func valid(_ i: Int, _ j: Int) -> Bool {
    for x in 0..<i {
        if table[x] == j || (i - x) == abs(table[x] - j) {
            return false
        }
    }
    
    return true
}

var res = 0
func dfs(_ i: Int) {
    if i == N {
//        print(table)
        res += 1
        return
    }
    
    var valids: [Int] = []
    for j in 0..<N {
        if valid(i, j) {
            valids.append(j)
        }
    }
    
    for j in valids {
        table[i] = j
        dfs(i+1)
    }
}

dfs(0)
print(res)
