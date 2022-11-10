// 구간합 Sb - Sa
import Foundation

func solution(_ elements:[Int]) -> Int {
    var circle = elements + elements
    for i in (1..<circle.count) {
        circle[i] += circle[i-1]
    }
    
    var nums: Set<Int> = []
    for d in 1...elements.count {
        for i in 0..<elements.count {
            nums.insert(circle[i+d] - circle[i])
        }
    }
    return nums.count
}
