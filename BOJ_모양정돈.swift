// 123 다른 위치
let N = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map { Int($0)! }

var counter = Array(repeating: 0, count: 3+1)
for a in arr {
    counter[a] += 1
}

let one = Array(repeating: 1, count: counter[1])
let two = Array(repeating: 2, count: counter[2])
let three = Array(repeating: 3, count: counter[3])

func swapCount(_ brr: [Int]) -> Int {
    var cnt = Array(repeating: [0,0,0,0], count: 4)
    for (a, b) in zip(arr, brr) {
        if a != b {
            cnt[b][a] += 1
        }
    }
    
    var c = 0
    var mi = min(cnt[1][2], cnt[2][1])
    c += mi
    cnt[1][2] -= mi
    cnt[2][1] -= mi
    
    mi = min(cnt[1][3], cnt[3][1])
    c += mi
    cnt[1][3] -= mi
    cnt[3][1] -= mi
    
    mi = min(cnt[2][3], cnt[3][2])
    c += mi
    cnt[2][3] -= mi
    cnt[3][2] -= mi
    
    c += cnt[1].reduce(0, +) * 2
    return c
}


var ans = N+1
ans = min(ans, swapCount(one+two+three))
ans = min(ans, swapCount(one+three+two))
ans = min(ans, swapCount(two+one+three))
ans = min(ans, swapCount(two+three+one))
ans = min(ans, swapCount(three+one+two))
ans = min(ans, swapCount(three+two+one))
print(ans)


