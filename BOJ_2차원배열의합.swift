// 2차 누적합
let line = readLine()!.split(separator: " ").map { Int($0)! }
let (N, M) = (line[0], line[1])
var arr: [[Int]] = [Array(repeating: 0, count: M+1)]
for _ in 0..<N {
    arr.append([0] + readLine()!.split(separator: " ").map { Int($0)! })
}

for i in 1...N {
    for j in 1...M {
        arr[i][j] += arr[i-1][j] + arr[i][j-1] - arr[i-1][j-1]
    }
}

let K = Int(readLine()!)!
for _ in 0..<K {
    let li = readLine()!.split(separator: " ").map { Int($0)! }
    let (i, j, x, y) = (li[0], li[1], li[2], li[3])
    
    print(arr[x][y]-arr[i-1][y]-arr[x][j-1]+arr[i-1][j-1])
}

