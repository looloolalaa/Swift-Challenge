// 2배 문자열에 포함되고, 길이가 같으면
import Foundation

let N = Int(readLine()!)!
var se = Set<String>()
func exist(_ str: String) -> Bool {
    for s in se {
        if s.count == str.count && (s+s).contains(str) {
            return true
        }
    }
    return false
}

for _ in 0..<N {
    let str = readLine()!
    if !exist(str) {
        se.insert(str)
    }
}

print(se.count)
