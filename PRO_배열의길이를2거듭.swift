// 4 < x <= 8
import Foundation

func solution(_ arr:[Int]) -> [Int] {
    var x = 1
    while !(arr.count <= x) {
        x *= 2
    }
    return arr + Array(repeating: 0, count: x - arr.count)
}
