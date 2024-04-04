// 규칙 파악 후 가로라인 세로라인
let N = Int(readLine()!)!
let K = 4*(N-1) + 1
var arr = Array(repeating: Array(repeating: " ", count: K), count: K)

var len = K
for k in stride(from: 0, through: K/2, by: 2) {
    for j in k..<(k+len) {
        arr[k][j] = "*"
        arr[K-k-1][j] = "*"
    }
    for i in k..<(k+len) {
        arr[i][k] = "*"
        arr[i][K-k-1] = "*"
    }
    len -= 4
}


for a in arr {
    print(a.joined(separator: ""))
}
