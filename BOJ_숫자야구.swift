// 브루트포스
let N = Int(readLine()!)!
var arr: [[Int]] = []
for _ in 0..<N {
    arr.append(readLine()!.split(separator: " ").map { Int($0)! })
}

func strikeAndBall(_ x: Int, _ y: Int) -> (Int, Int) {
    let (x, y) = (Array(String(x)), Array(String(y)))
    var (strike, ball) = (0, 0)
    for i in 0..<3 {
        if x[i] == y[i] { strike += 1 }
    }
    
    if y[0] == x[1] || y[0] == x[2] { ball += 1 }
    if y[1] == x[0] || y[1] == x[2] { ball += 1 }
    if y[2] == x[0] || y[2] == x[1] { ball += 1 }
    
    return (strike, ball)
}

var res: [Int] = []
for i in 123...987 {
    let s = Array(String(i))
    if s.contains("0") || s[0] == s[1] || s[1] == s[2] || s[2] == s[0] { continue }
    
    if arr.allSatisfy({ a in strikeAndBall(i, a[0]) == (a[1], a[2]) }) {
        res.append(i)
    }
}

print(res.count)
