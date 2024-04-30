// 연속으로 같은 문자 세기(look and say)
import Foundation

let inp = readLine()!

var maxi = ""
let spl = inp.components(separatedBy: "K")
for m in spl[..<(spl.count-1)] {
    maxi += "5" + String(repeating: "0", count: m.count)
}
if let la = spl.last {
    maxi += String(repeating: "1", count: la.count)
}

print(maxi)

let s = Array(inp)
var mini = ""
var i = 0
while i < s.count {
    if s[i] == "K" { mini += "5" }
    else {
        var j = i
        while j < s.count-1 && s[j] == s[j+1] {
            j += 1
        }
        
        let len = j-i+1
        mini += "1" + String(repeating: "0", count: len-1)
        i = j
    }
    i += 1
}

print(mini)
