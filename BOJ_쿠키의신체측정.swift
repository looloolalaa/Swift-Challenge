// 구현
let N = Int(readLine()!)!
var arr: [[Character]] = []
for _ in 0..<N {
    arr.append(Array(readLine()!))
}

var heart = (-1, -1)
for i in 0..<N {
    for j in 0..<N {
        if arr[i][j] == "*" {
            heart = (i+1, j)
            break
        }
    }
    if heart != (-1, -1) { break }
}

func valid(_ a: Int, _ b: Int) -> Bool {
    return (0..<N)~=a && (0..<N)~=b
}

var res: [Int] = []

var cnt = 0
var (a, b) = (heart.0, heart.1-1)
while valid(a, b) && arr[a][b] == "*" {
    cnt += 1
    b -= 1
}
res.append(cnt)

cnt = 0
(a, b) = (heart.0, heart.1+1)
while valid(a, b) && arr[a][b] == "*" {
    cnt += 1
    b += 1
}
res.append(cnt)

cnt = 0
(a, b) = (heart.0+1, heart.1)
while valid(a, b) && arr[a][b] == "*" {
    cnt += 1
    a += 1
}
res.append(cnt)

let center = (a, b)
cnt = 0
(a, b) = (center.0, center.1-1)
while valid(a, b) && arr[a][b] == "*" {
    cnt += 1
    a += 1
}
res.append(cnt)

cnt = 0
(a, b) = (center.0, center.1+1)
while valid(a, b) && arr[a][b] == "*" {
    cnt += 1
    a += 1
}
res.append(cnt)

print(heart.0+1, heart.1+1)
print(res.map { String($0) }.joined(separator: " "))

