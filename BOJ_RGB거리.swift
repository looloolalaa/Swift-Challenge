// dp 3개
let N = Int(readLine()!)!
var arr: [[Int]] = []
for _ in 0..<N {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    arr.append(line)
}

for i in 1..<N {
    arr[i][0] += min(arr[i-1][1], arr[i-1][2])
    arr[i][1] += min(arr[i-1][0], arr[i-1][2])
    arr[i][2] += min(arr[i-1][0], arr[i-1][1])
}

print(arr[N-1].min()!)
