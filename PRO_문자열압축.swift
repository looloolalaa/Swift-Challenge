// [start..<start+spl]
import Foundation

func solution(_ s:String) -> Int {
    
    func compress(_ s: [String]) -> String {
        var res = ""
        var now = ""
        var counter = 1
        for c in (s + [""]) {
            let st = String(c)
            if now != st {
                res += counter > 1 ? "\(counter)\(now)" : "\(now)"
                now = st
                counter = 1
            } else {
                counter += 1
            }
        }

        return res
    }
    
    
    let s = Array(s)
    
    var result = 1000
    for spl in 1...s.count {
        var candis: [String] = []
        var start = 0
        while start + spl <= s.count {
            candis.append(String(s[start..<start+spl]))
            start += spl
        }
        candis.append(String(s[start...]))

        result = min(result, (compress(candis).count))
    }
    
    return result
}


