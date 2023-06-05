// 4 < x <= 8
import Foundation

func solution(_ arr:[Int]) -> [Int] {
    let len = Int(pow(2, (ceil(log2(Double(arr.count))))))
    return arr + Array(repeating: 0, count: len - arr.count)
}
