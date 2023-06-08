// eval 구현: 앞에서 부터 차례로 계산
import Foundation

func solution(_ my_string:String) -> Int {
    // let my_string = "1 + 2 + 3"
    let s = my_string.components(separatedBy: " ")
    
    var res = Int(s[0])!
    for i in 1..<s.count {
        if (s[i].allSatisfy { $0.isNumber }) {
            if s[i-1] == "+" {
                res += Int(s[i])!
            } else {
                res -= Int(s[i])!
            }
        }
    }
    
    return res
}
