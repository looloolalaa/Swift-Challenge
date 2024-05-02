// ABCBCA
let s = Array(readLine()!)
var res = 0
for i in 0..<52 {
    for j in (i+1)..<52 {
        if s[i] == s[j] {
            var counter: [Character: Int] = [:]
            for k in s[(i+1)..<j] {
                counter[k, default: 0] += 1
            }
            
            for (_, v) in counter {
                if v == 1 {
                    res += 1
                }
            }
        }
    }
}

print(res / 2)
