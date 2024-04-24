// 집합에 "abc" "bca" "cab" 저장하기
let N = Int(readLine()!)!
var s = Set<[Character]>()
for _ in 0..<N {
    var str = Array(readLine()!)
    if !s.contains(str) {
        for _ in 0..<str.count {
            s.insert(str)
            str.append(str.remove(at: 0))
        }
    }
}

var res = 0
for str in s {
    if s.contains(str) {
        res += 1
        var str = str
        for _ in 0..<str.count {
            s.remove(str)
            str.append(str.remove(at: 0))
        }
    }
}

print(res)
