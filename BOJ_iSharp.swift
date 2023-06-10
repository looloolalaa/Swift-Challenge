// 문자열 처리: split 여러개
import Foundation

let spl = readLine()!.components(separatedBy: [" ", ",", ";"]).filter { $0 != "" }

func divided(_ s: String) -> [String] {
//    a*[]&
    let str = s.replacingOccurrences(of: "[]", with: "$")
    let s = Array(str)
    for i in 0..<s.count {
        if s[i] == "$" || s[i] == "&" || s[i] == "*" {
            return [String(s[..<i]), String(s[i...].reversed()).replacingOccurrences(of: "$", with: "[]")]
        }
    }

    return [String(s), ""]
}

for s in spl[1...] {
    let di = divided(s)
    print(spl[0] + di[1] + " " + di[0] + ";")
}

