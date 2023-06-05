// 큰 수 더하기 => 문자열로 올리기
import Foundation

func solution(_ a:String, _ b:String) -> String {
    var (a, b) = (a, b)
    // var (a, b) = ("0", "404")
    
    var result = ""
    var up = false
    for _ in 0..<max(a.count, b.count) + 1 {
        var (n, m) = (0, 0)
        if let x = a.popLast() {
            n = Int(String(x))!
        }
        if let y = b.popLast() {
            m = Int(String(y))!
        }
        
        let res = n + m + (up ? 1 : 0)
        if res < 10 {
            up = false
            result.append(String(res))
        } else {
            up = true
            result.append(String(res - 10))
        }
        
    }
    
    result = String(result.reversed())
    if result.first! == "0" { result.removeFirst() }
    return result == "" ? "0" : result
}
