// 색종이 테두리 구하기 + dxy누적 ([i][j+1], [i+1][j])
let N = Int(readLine()!)!
var arr = Array(repeating: Array(repeating: 0, count: 102), count: 102)

for _ in 0..<N {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    let (i, j) = (line[0]+1, line[1]+1)
    
    arr[i][j] += 1
    arr[i][j+10] -= 1
    arr[i+10][j] -= 1
    arr[i+10][j+10] += 1
    
}

for i in 1..<102 {
    for j in 1..<102 {
        arr[i][j] += arr[i-1][j] + arr[i][j-1] - arr[i-1][j-1]
    }
}

var res = 0
for i in 1..<101 {
    for j in 1..<101 {
        if arr[i][j] != 0 {
            if arr[i-1][j] == 0 {
                res += 1
            }
            if arr[i][j+1] == 0 {
                res += 1
            }
            if arr[i+1][j] == 0 {
                res += 1
            }
            if arr[i][j-1] == 0 {
                res += 1
            }
        }
    }
}

print(res)
