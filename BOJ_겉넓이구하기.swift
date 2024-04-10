// 3차원 겉넓이
let line = readLine()!.split(separator: " ").map { Int($0)! }
let (N, M) = (line[0], line[1])
var arr: [[Int]] = []
for _ in 0..<N {
    arr.append(readLine()!.split(separator: " ").map { Int($0)! })
}

var topBottom = 2*N*M
var left = 0
for i in 0..<N {
    left += arr[i][0]
    for j in 1..<M {
        if arr[i][j-1] < arr[i][j] {
            left += arr[i][j] - arr[i][j-1]
        }
    }
}

var front = 0
for j in 0..<M {
    front += arr[0][j]
    for i in 1..<N {
        if arr[i-1][j] < arr[i][j] {
            front += arr[i][j] - arr[i-1][j]
        }
    }
}

print(topBottom + 2*left + 2*front)
