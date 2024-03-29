// 집합 확인하기
let line = readLine()!.split(separator: " ").map { Int($0)! }
let (K, L) = (line[0], line[1])
var arr: [String] = []
for _ in 0..<L {
    arr.append(readLine()!)
}

var res: [String] = []
var s = Set<String>()
for a in arr.reversed() {
    if !s.contains(a) {
        s.insert(a)
        res.append(a)
    }
}

res.reverse()
if K < res.count {
    res = Array(res[..<K])
}

for r in res {
    print(r)
}
