// M 개수 세기
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

var mini = ""
var len = 0
for c in inp {
    if c == "M" { len += 1 }
    else {
        if len > 0 {
            mini += "1" + String(repeating: "0", count: len-1)
            len = 0
        }
        mini += "5"
    }
}
if len > 0 {
    mini += "1" + String(repeating: "0", count: len-1)
}

print(mini)
