// move remain dfs + 10^digit
import Foundation

let book = [
    [0, 4, 3, 3, 4, 3, 2, 3, 1, 2],
    [4, 0, 5, 3, 2, 5, 6, 1, 5, 4],
    [3, 5, 0, 2, 5, 4, 3, 4, 2, 3],
    [3, 3, 2, 0, 3, 2, 3, 2, 2, 1],
    [4, 2, 5, 3, 0, 3, 4, 3, 3, 2],
    [3, 5, 4, 2, 3, 0, 1, 4, 2, 1],
    [2, 6, 3, 3, 4, 1, 0, 5, 1, 2],
    [3, 1, 4, 2, 3, 4, 5, 0, 4, 3],
    [1, 5, 2, 2, 3, 2, 1, 4, 0, 1],
    [2, 4, 3, 1, 2, 1, 2, 3, 1, 0]
]

let li = readLine()!.split(separator: " ").map { Int($0)! }
let (N, K, P, x) = (li[0], li[1], li[2], li[3])
var X = String(x).map { Int(String($0))! }
X = Array(repeating: 0, count: K-X.count) + X

var cnt = 0
func dfs(_ idx: Int, _ p: Int, _ num: Int) {
    if num > N {
        return
    }
    
    if idx == K {
        if (1...N)~=num { cnt += 1 }
        return
    }
    
    for (i, move) in book[X[idx]].enumerated() {
        if move <= p {
            let digit = Double(K-idx-1)
            dfs(idx+1, p - move, num + i * Int(pow(10, digit)))
        }
    }
}

dfs(0, P, 0)
print(cnt-1)

