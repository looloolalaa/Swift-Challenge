//2 combination
import Foundation

func solution(_ numbers:[Int]) -> [Int] {
    var s: Set<Int> = Set()
    for i in numbers.indices {
        for j in (i+1..<numbers.count) {
            s.insert(numbers[i] + numbers[j])
        }
    }
    
    return Array(s).sorted()
}
