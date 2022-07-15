// isPrime + combinations
import Foundation

func solution(_ nums:[Int]) -> Int {
    func isPrime(_ n: Int) -> Bool {
        if n == 1 { return false }
        return (2..<Int(sqrt(Double(n))) + 1).allSatisfy { n % $0 != 0 }
    }
    
    func combinations(_ array: [Int], select n: Int) -> [[Int]] {
        var total: [[Int]] = []
        var result: [Int] = Array(repeating: 0, count: n)

        func combi(_ level: Int, _ start: Int) {
            if level == result.count {
                total.append(result)
                return
            }
            for j in start..<array.count {
                result[level] = array[j]
                combi(level+1, j+1)
            }
        }
        combi(0, 0)
        return total
    }
    
    return combinations(nums, select: 3)
        .map { $0.reduce(0, +) }
        .filter { isPrime($0) }
        .count
}
