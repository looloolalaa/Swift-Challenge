// 문자 Set
let N = Int(readLine()!)!
var res = 0
for _ in 0..<N {
    let s = readLine()! + "-"
    
    var alpha = Set<Character>()
    var now: Character = s.first!
    var valid = true
    for c in s {
        if now != c {
            if alpha.contains(c) {
                valid = false
                break
            }
            alpha.insert(now)
            now = c
        }
    }
    
    if valid { res += 1 }
}

print(res)
