// 123 456
// m == 1*6 + 2*5 + 3*4
import Foundation

func solution(_ A:[Int], _ B:[Int]) -> Int {
    return zip(A.sorted(by: <), B.sorted(by: >)).reduce(0) { $0 + $1.0 * $1.1 }
}
