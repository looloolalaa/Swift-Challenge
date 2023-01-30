// 기준에서 뒤를 모두 탐색 해야 할때
// O(N^2) -> O(N) Stack
import Foundation

func solution(_ numbers:[Int]) -> [Int] {
    var result = Array(repeating: -1, count: numbers.count)
    
    var stack: [(Int, Int)] = []
    for i in 0..<numbers.count {
        while !stack.isEmpty && stack.last!.1 < numbers[i] {
            let (j, _) = stack.popLast()!
            result[j] = numbers[i]
        }
        stack.append((i, numbers[i]))
    }
    return result
}


