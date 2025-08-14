// 사각형 길 jump 가짓수
let N = Int(readLine()!)!
var arr: [[Int]] = []
for _ in 0..<N {
    arr.append(readLine()!.split(separator: " ").map { Int($0)! })
}

var cnt = Array(repeating: Array(repeating: 0, count: N), count: N)
cnt[0][0] = 1

for i in 0..<N {
    for j in 0..<N {
        let move = arr[i][j]
        if move == 0 { continue }
        
        if j+move < N {
            cnt[i][j+move] += cnt[i][j]
        }
        if i+move < N {
            cnt[i+move][j] += cnt[i][j]
        }
    }
}

print(cnt[N-1][N-1])

