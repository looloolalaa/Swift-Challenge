// Counter.count
import Foundation

func solution(_ topping:[Int]) -> Int {
    var leftCounter: [Int: Int] = [:]
    var rightCounter: [Int: Int] = [:]
    for t in topping {
        rightCounter[t, default: 0] += 1
    }
    
    var result = 0
    for t in topping {
        leftCounter[t, default: 0] += 1
        rightCounter[t]! -= 1
        if rightCounter[t]! == 0 {
            rightCounter[t] = nil
        }
        
        if leftCounter.count == rightCounter.count {
            result += 1
        }
        
    }
    
    return result
}
