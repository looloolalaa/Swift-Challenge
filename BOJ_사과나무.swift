// 2차원 누적합
let N = Int(readLine()!)!
var arr: [[Int]] = [Array(repeating: 0, count: N+1)]
for _ in 0..<N {
    arr.append([0] + readLine()!.split(separator: " ").map { Int($0)! })
}

for i in 1...N {
    for j in 1...N {
        arr[i][j] += arr[i-1][j] + arr[i][j-1] - arr[i-1][j-1]
    }
}

func area(_ x1: Int, _ y1: Int, _ x2: Int, _ y2: Int) -> Int {
    return arr[x2][y2] - arr[x1-1][y2] - arr[x2][y1-1] + arr[x1-1][y1-1]
}

var ans = -Int(1e9)
for k in 1...N {
    for i in 1...N-k+1 {
        for j in 1...N-k+1 {
            ans = max(ans, area(i, j, i+k-1, j+k-1))
        }
    }
}
print(ans)
