// 문자 하나 삭제로 대칭되는가?
func check(_ str: [Character]) -> Int {
    func isSymm(_ i: Int, _ j: Int) -> Bool {
        var (s, e) = (i, j)
        while s < e {
            if str[s] == str[e] {
                s += 1
                e -= 1
            } else {
                return false
            }
        }
        return true
    }
    
    
    var (le, ri) = (0, str.count-1)
    while le < ri {
        if str[le] == str[ri] {
            le += 1
            ri -= 1
        } else {
            if isSymm(le+1, ri) || isSymm(le, ri-1) {
                return 1
            }
            return 2
        }
    }
    
    return 0
}

for _ in 0..<Int(readLine()!)! {
    let str = Array(readLine()!)
    print(check(str))
}
