// 다음 순열
let T = Int(readLine()!)!
for _ in 0..<T {
    var s = Array(readLine()!)
    var i = s.count-1
    while 0 < i && s[i-1] >= s[i] {
        i -= 1
    }
    
    if i == 0 {
        print(String(s))
        continue
    }
    
    let j = (i..<s.count).filter { s[$0] > s[i-1] }.min { s[$0] < s[$1] }!
    (s[i-1], s[j]) = (s[j], s[i-1])
    print(String(s[..<i] + s[i...].sorted()))
}
