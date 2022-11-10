// stack
import Foundation

func solution(_ order:[Int]) -> Int {
    var container = (0..<order.count).map { order.count - $0 }
    var temp: [Int] = []
    
    var result = 0
    for target in order {
        if !container.isEmpty && container.last! <= target {
            // container pop
            while container.last! != target {
                temp.append(container.removeLast())
            }
            container.removeLast()
            result += 1
        } else {
            // see temp
            if temp.last! != target { break }
            else {
                temp.removeLast()
                result += 1
            }
        }
    }
    
    return result
}


// [5,4,3,2,1]
// [4,3,1,2,5]
