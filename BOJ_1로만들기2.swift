// dp 경로 저장
let N = Int(readLine()!)!

var arr: [(Int, Int)] = Array(repeating: (Int(1e9), -1), count: N+1)
arr[N] = (0, N)

for i in stride(from: N, to: 0, by: -1) {
    let d = arr[i].0 + 1
    if arr[i-1].0 > d {
        arr[i-1] = (d, i)
    }
    if i % 2 == 0 && arr[i/2].0 > d {
        arr[i/2] = (d, i)
    }
    if i % 3 == 0 && arr[i/3].0 > d {
        arr[i/3] = (d, i)
    }
}

var ans: [Int] = []
var i = 1
while i != N {
    ans.append(i)
    i = arr[i].1
}
ans.append(N)

print(arr[1].0)
print(ans.reversed().map { String($0) }.joined(separator: " "))
