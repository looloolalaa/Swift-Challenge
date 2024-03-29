// 인덱스 사용 - 빠름
let N = Int(readLine()!)!
var a: [String] = []
var b: [String] = []
for _ in 0..<N {
    a.append(readLine()!)
}
for _ in 0..<N {
    b.append(readLine()!)
}

var res = 0
let arr = b.map { a.firstIndex(of: $0)! }
for i in 0..<N {
    for j in (i+1)..<N {
        if arr[i] > arr[j] {
            res += 1
            break
        }
    }
}

print(res)
