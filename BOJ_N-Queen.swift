// dfs
import Foundation

let N = Int(readLine()!)!
var board = Array(repeating: -1, count: N)

var res = 0
func dfs(_ depth: Int) {
    if depth == N {
        res += 1
        return
    }
    
    func canPut(_ j: Int) -> Bool {
        for i in 0..<depth {
            if board[i] == j || abs(board[i]-j) == depth-i {
                return false
            }
        }
        return true
    }
    
    for j in (0..<N).filter({ canPut($0) }) {
        board[depth] = j
        dfs(depth+1)
        board[depth] = -1
    }
}

dfs(0)
print(res)
