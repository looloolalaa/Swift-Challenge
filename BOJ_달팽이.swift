// 나선형 순회
let N = Int(readLine()!)!
let X = Int(readLine()!)!
var arr: [[Int]] = Array(repeating: Array(repeating: 0, count: N), count: N)

let dxy = [[-1, 0], [0, 1], [1, 0], [0, -1]]
var d = 0
var (a, b) = (N/2, N/2)
var i = 1
var len = 1

var res = (-1, -1)
while i <= N*N {
    for _ in 0..<len {
        arr[a][b] = i
        if i == X { res = (a, b) }
        i += 1
        (a, b) = (a+dxy[d][0], b+dxy[d][1])
    }
    d = (d+1)%4
    if d % 2 == 0 { len += 1 }
}

for a in arr {
    print(a.map { String($0) }.joined(separator: " "))
}

print(res.0 + 1, res.1 + 1)

