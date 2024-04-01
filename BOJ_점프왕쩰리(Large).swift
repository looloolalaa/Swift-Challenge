// dfs 순서
import Foundation

let N = Int(readLine()!)!
var arr: [[Int]] = []
for _ in 0..<N {
    arr.append(readLine()!.split(separator: " ").map { Int($0)! })
}

func dfs(_ i: Int, _ j: Int) {
    if i >= N || j >= N { return }
    if arr[i][j] == 0 { return }
    
    if arr[i][j] == -1 { print("HaruHaru"); exit(0) }
    let d = arr[i][j]
    arr[i][j] = 0
    
    dfs(i, j+d)
    dfs(i+d, j)
}

dfs(0, 0)

print("Hing")
