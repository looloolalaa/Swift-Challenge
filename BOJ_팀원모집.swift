// 1...M 개 선택 dfs
import Foundation

let NM = readLine()!.split(separator: " ").map { Int($0)! }
let (N, M) = (NM[0], NM[1])
var arr: [Int] = []
for _ in 0..<M {
    arr.append(readLine()!.split(separator: " ")[1...].map { 1<<(Int($0)!-1) }.reduce(0, |))
}

func dfs(_ i: Int, _ j: Int, _ sel: Int, _ visited: Int) {
    if i == sel {
        if visited == (1<<N)-1 {
            print(sel); exit(0)
        }
        return
    }
    
    for k in j..<M {
        dfs(i+1, k+1, sel, visited | arr[k])
    }
}

for se in 1...M {
    dfs(0, 0, se, 0)
}
print(-1)

