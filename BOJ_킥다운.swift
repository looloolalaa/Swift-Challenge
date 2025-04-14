// 홈 대보기
var a = readLine()!.map { Int(String($0))! }
var b = readLine()!.map { Int(String($0))! }
var ans = a.count + b.count
if a.count < b.count { (a, b) = (b, a) }

let zero = Array(repeating: 0, count: b.count)
a = zero + a + zero

func minLen(_ s: Int) -> Int {
    var a = a
    for i in s..<s+b.count {
        a[i] += b[i-s]
    }
    
    var len = 0
    for i in 0..<a.count {
        if a[i] >= 4 {
            return -1
        }
        if a[i] > 0 {
            len += 1
        }
    }
    return len
}


for s in 0..<a.count-b.count {
    let len = minLen(s)
    if len != -1 {
        ans = min(ans, len)
    }
}
print(ans)
