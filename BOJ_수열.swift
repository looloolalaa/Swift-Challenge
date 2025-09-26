// 연속증가수열
let N = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map { Int($0)! }

var ans = 1

var i = 0
var len = 1
while i < N-1 {
    while i < N-1 && arr[i] <= arr[i+1] {
        len += 1
        i += 1
    }
    ans = max(ans, len)
    len = 1
    i += 1
}

i = 0
len = 1
while i < N-1 {
    while i < N-1 && arr[i] >= arr[i+1] {
        len += 1
        i += 1
    }
    ans = max(ans, len)
    len = 1
    i += 1
}

print(ans)
