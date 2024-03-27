// Counter 단어 차이
func minus(_ x: [Character: Int], _ y: [Character: Int]) -> [Character: Int] {
    var res = x
    for (k, v) in y {
        if res[k] != nil {
            res[k]! -= v
            if res[k]! <= 0 {
                res[k] = nil
            }
        }
    }
    return res
}


let N = Int(readLine()!)!
let s = readLine()!
var res = 0
for _ in 0..<N-1 {
    let a = readLine()!
    let (x, y) = (s.count >= a.count) ? (s, a) : (a, s)
    var cx: [Character: Int] = [:]
    var cy: [Character: Int] = [:]
    x.forEach { cx[$0, default: 0] += 1 }
    y.forEach { cy[$0, default: 0] += 1 }
    
    var m = minus(cx, cy)
    if m.count == 0 {
        res += 1
    } else if m.count == 1 && m.popFirst()!.value == 1 {
        res += 1
    }
    
}

print(res)
