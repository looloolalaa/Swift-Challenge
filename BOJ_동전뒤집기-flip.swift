// row flip
let N = Int(readLine()!)!
var arr: [[Character]] = []
for _ in 0..<N {
    arr.append(Array(readLine()!))
}

func flip(_ row: Int) {
    for j in 0..<N {
        arr[row][j] = (arr[row][j] == "H") ? "T" : "H"
    }
}

func cnt() -> Int {
    var res = 0
    for j in 0..<N {
        var t = 0
        for i in 0..<N {
            if arr[i][j] == "T" {
                t += 1
            }
        }
        res += min(t, N-t)
    }
    return res
}

var ans = N*N+1
func dfs(_ row: Int) {
    if row == N {
        ans = min(ans, cnt())
        return
    }
    
    dfs(row+1)
    
    flip(row)
    dfs(row+1)
    flip(row)
}

dfs(0)
print(ans)
