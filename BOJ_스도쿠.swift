// 0인 놈들만 dfs + 백트래킹
import Foundation

var table: [[Int]] = []
for _ in 0..<9 {
    table.append(readLine()!.components(separatedBy: " ").map { Int($0)! })
}

var blanks: [[Int]] = []
for i in 0..<9 {
    for j in 0..<9 {
        if table[i][j] == 0 {
            blanks.append([i, j])
        }
    }
}

func valid(_ i: Int, _ j: Int, _ k: Int) -> Bool {
    for b in 0..<9 {
        if table[i][b] == k {
            return false
        }
    }
    for a in 0..<9 {
        if table[a][j] == k {
            return false
        }
    }

    let (ni, nj) = ((i/3)*3, (j/3)*3)
    for a in ni..<(ni+3) {
        for b in nj..<(nj+3) {
            if table[a][b] == k {
                return false
            }
        }
    }

    return true
}

func dfs(_ i: Int) {
    if i == blanks.count {
        for t in table {
            for a in t {
                print(a, terminator: " ")
            }
            print()
        }
        exit(0)
    }

    let (x, y) = (blanks[i][0], blanks[i][1])
    for k in 1...9 {
        if valid(x, y, k) {
            table[x][y] = k
            dfs(i + 1)
            table[x][y] = 0
        }
    }
}

dfs(0)


