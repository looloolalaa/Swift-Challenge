// binary convert
import Foundation

func solution(_ s:String) -> [Int] {
    var s = s
    var (counter, zeros) = (0, 0)
    while s != "1" {
        let zero = s.filter { $0 == "0" }.count
        zeros += zero
        
        s = String(s.count - zero, radix: 2)
        counter += 1
    }
    return [counter, zeros]
}
