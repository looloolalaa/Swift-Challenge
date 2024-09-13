// 부분행렬 최대합
// (전역vs지역 속도차? 캐시 속도차?)
let NM = readLine()!.split(separator: " ").map { Int($0)! }
let (N, M) = (NM[0], NM[1])

var arr: [[Int]] = [Array(repeating: 0, count: M+1)]
for _ in 0..<N {
    arr.append([0] + readLine()!.split(separator: " ").map { Int($0)! })
}

for i in 1...N {
    for j in 1...M {
        arr[i][j] += arr[i-1][j] + arr[i][j-1] - arr[i-1][j-1]
    }
}

func area(_ x1: Int, _ y1: Int, _ x2: Int, _ y2: Int) -> Int {
    return arr[x2][y2] - arr[x1-1][y2] - arr[x2][y1-1] + arr[x1-1][y1-1]
}

var ans = -Int(1e9)
for h in 0..<N {
    for w in 0..<M {
        for x in 1..<N-h+1 {
            for y in 1..<M-w+1 {
                ans = max(ans, area(x, y, x+h, y+w))
            }
        }
    }
}
print(ans)

