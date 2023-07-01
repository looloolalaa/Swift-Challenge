// 문자열 구현 순서대로 처음부터
import Foundation

func solution(_ s:String) -> Int {
    let s = Array(s) + ["-"]
    var result = 0
    
    var x = s[0]
    var (same, diff) = (0, 0)
    for i in 0..<(s.count-1) {
        let c = s[i]
        if c == x {
            same += 1
        } else {
            diff += 1
        }
        
        if same == diff {
            result += 1
            x = s[i+1]
            (same, diff) = (0, 0)
        }
    }
    
    if same != diff {
        result += 1
    }
    
    return result
}
