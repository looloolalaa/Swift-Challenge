//divisor count is odd?
import Foundation

func solution(_ left:Int, _ right:Int) -> Int {
    let odd: Set<Int> = Set((1...100).map { $0 * $0 })
    return (left...right).map { i in odd.contains(i) ? -i: i }.reduce(0, +)
}
