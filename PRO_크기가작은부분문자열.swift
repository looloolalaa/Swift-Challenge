// String slicing
import Foundation

func solution(_ t:String, _ p:String) -> Int {
    let (t, n) = (Array(t), Int(p)!)
    var result = 0
    for i in 0..<(t.count - p.count + 1) {
        if n >= Int(String(t[i..<i+p.count]))! {
            result += 1
        }
    }
    return result
}
