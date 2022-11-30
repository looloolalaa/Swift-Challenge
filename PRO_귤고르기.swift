// counter
import Foundation

func solution(_ k:Int, _ tangerine:[Int]) -> Int {
    var counter: [Int: Int] = [:]
    for t in tangerine {
        counter[t, default: 0] += 1
    }
    var sortedCounter = Array(counter).sorted { $0.value < $1.value }
    
    var k = k
    var result = 0
    while k > 0 {
        k -= sortedCounter.removeLast().value
        result += 1
    }
    return result
}
