//Set
import Foundation

func solution(_ numbers:[Int]) -> Int {
    let numSet: Set<Int> = Set(0...9)
    let remain = numSet.subtracting(Set(numbers))
    return remain.reduce(0, +)
}
