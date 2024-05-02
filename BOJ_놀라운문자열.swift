// 배열 모든 값이 유니크?
func valid(_ str: String) -> Bool {
    let s = Array(str)
    for d in 1..<s.count {
        var se = Set<String>()
        for i in 0..<s.count-d {
            se.insert(String(s[i]) + String(s[i+d]))
        }
        if se.count != s.count-d { return false }
    }
    return true
}


while true {
    let str = readLine()
    guard let str = str, str != "*" else { break }
    
    print("\(str) is \(valid(str) ? "surprising" : "NOT surprising").")
}
