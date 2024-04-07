// 가로등 사이
let N = Int(readLine()!)!
let M = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map { Int($0)! }

var res = 0
res = max(res, arr.first!)
res = max(res, N-arr.last!)

for i in 0..<(M-1) {
    var d = (arr[i+1] - arr[i])
    if d % 2 == 1 { d += 1 }
    res = max(res, d / 2)
}

print(res)
