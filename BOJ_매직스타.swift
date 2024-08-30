// 백트래킹: break loop1
import Foundation

let book = ["A": 1, "B": 2, "C": 3, "D": 4, "E": 5, "F": 6, "G": 7, "H": 8, "I": 9, "J": 10, "K": 11, "L": 12, ".": 0, "x": -1]

var arr: [[Int]] = []
for _ in 0..<5 {
    arr.append(Array(readLine()!).map { book[String($0)]! })
}

var visited = Array(repeating: false, count: 12+1)
for i in 0..<5 {
    for j in 0..<9 {
        if arr[i][j] >= 1 {
            visited[arr[i][j]] = true
        }
    }
}

let lines = [
    [[0,4], [1,3], [2,2], [3,1]],
    [[3,1], [3,3], [3,5], [3,7]],
    [[3,7], [2,6], [1,5], [0,4]],
    
    [[1,1], [2,2], [3,3], [4,4]],
    [[4,4], [3,5], [2,6], [1,7]],
    [[1,7], [1,5], [1,3], [1,1]],
]

func lineValid(_ line: [[Int]]) -> Bool {
    for ij in line {
        if arr[ij[0]][ij[1]] == -1 {
            return true
        }
    }
    return line.map { arr[$0[0]][$0[1]] }.reduce(0, +) == 26
}

func valid() -> Bool {
    for line in lines {
        if !lineValid(line) {
            return false
        }
    }
    return true
}

func allVisited() -> Bool {
    for i in 1...12 {
        if !visited[i] {
            return false
        }
    }
    return true
}

func printAns() {
    for a in arr {
        for n in a {
            for (k, v) in book {
                if v == n {
                    print(k, terminator: "")
                    break
                }
            }
        }
        print()
    }
}

func dfs() {
    if allVisited() {
        printAns()
        exit(0)
    }
    
    loop1: for i in 0..<5 {
        for j in 0..<9 {
            if arr[i][j] == -1 {
                for n in 1...12 where !visited[n] {
                    arr[i][j] = n
                    if valid() {
                        visited[n] = true
                        dfs()
                        visited[n] = false
                    }
                }
                arr[i][j] = -1
                break loop1
            }
        }
    }
}

dfs()

