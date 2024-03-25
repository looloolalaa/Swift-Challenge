// +1 이 연속으로 5개 범위
let N = Int(readLine()!)!
var arr = Set<Int>()
for _ in 0..<N {
    arr.insert(Int(readLine()!)!)
}

var res = 5
for a in arr {
    res = min(res, 5 - [a,a+1,a+2,a+3,a+4].filter { arr.contains($0) }.count)
}
print(res)


