// 집합 사용 - 느림
let N = Int(readLine()!)!
var a: [String] = []
var b: [String] = []
for _ in 0..<N {
    a.append(readLine()!)
}
for _ in 0..<N {
    b.append(readLine()!)
}

var criminal = Set<String>()
for i in 0..<N-1 {
    let me = a[i]
    let back = Set(a[(i+1)...])
    let newBack = Set(b[b.firstIndex(of: me)!...])
    
    let cri = back.subtracting(newBack)
    criminal = criminal.union(cri)
}

print(criminal.count)

