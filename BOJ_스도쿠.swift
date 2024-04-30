// 0일때 놓을 수 있는 숫자들
import Foundation

func valid(_ i: Int, _ j: Int, _ n: Int) -> Bool {
    for y in 0..<9 {
        if arr[i][y] == n {
            return false
        }
    }
    for x in 0..<9 {
        if arr[x][j] == n {
            return false
        }
    }
    let (a, b) = (i/3*3, j/3*3)
    for x in 0..<3 {
        for y in 0..<3 {
            if arr[a+x][b+y] == n {
                return false
            }
        }
    }
    
    return true
}

var arr: [[Int]] = []
for _ in 0..<9 {
    arr.append(Array(readLine()!).map { Int(String($0))! })
}

func dfs(_ idx: Int) {
    if idx == 81 {
        for a in arr {
            print(a.map { String($0) }.joined(separator: ""))
        }
        exit(0)
    }
    
    let (i, j) = (idx/9, idx%9)
    if arr[i][j] != 0 {
        dfs(idx+1)
    } else {
        for n in 1...9 {
            if valid(i, j, n) {
                arr[i][j] = n
                dfs(idx+1)
                arr[i][j] = 0
            }
        }
    }
    
}

dfs(0)




