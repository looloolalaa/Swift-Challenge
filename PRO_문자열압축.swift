// check com[-1].1
import Foundation

func solution(_ s:String) -> Int {
    let s = Array(s)
    
    var candis: [Int] = []
    for n in (1...s.count) {
        var compressed = [(1, s[0..<n])]

        var i = n
        while i+n <= s.count {
            if compressed[compressed.count-1].1 == s[i..<i+n] {
                compressed[compressed.count-1].0 += 1
            } else {
                compressed.append((1, s[i..<i+n]))
            }
            i += n
        }
        compressed.append((1, s[i...]))
        
        let comStr: [String] = compressed.map { c, arr in
            if c == 1 { return String(arr) }
            else { return String(c) + String(arr) }
        }
        candis.append(comStr.joined().count)
    }
    
    return candis.min()!
}


